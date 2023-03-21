
//
//  ChardViewModel.swift
//  Drunk
//
//  Created by Yin-Lin Chen on 2023/3/4.
//

import Foundation
import Combine
import MapKit
import CoreData

final class ChardViewModel: ObservableObject {
    @Published var businesses = [Business]()
    @Published var searchText: String
    @Published var selectedCategory: FoodCategory
    @Published var region: MKCoordinateRegion
    @Published var business: Business?
    @Published var completions = [String]()
    @Published var show = false
    @Published var start = false
    
    var cancellables = [AnyCancellable]()
    
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "BarModel")
        container.loadPersistentStores { _, error in
            guard error == nil else {
            fatalError("can't find")
            }
        }
        return container
    }()
    
    init() {
        searchText = ""
        selectedCategory = .alcohol
        region = .init()
        business = nil
        
        request()
    }
    
    func request(service: ApiService = .live) {

        $searchText
            .debounce(for: 0.3, scheduler:  DispatchQueue.main)
            .combineLatest($selectedCategory)
            .map { (term, category) in
                service.request(
                    .search(
                        term: "chardonnay",
                        location: .init(latitude: 41.881832, longitude: -87.623177),
                        category: term.isEmpty ? category: nil
                    )
                )
            }
            .switchToLatest()
            .assign(to: &$businesses)
        
        $searchText
            .debounce(for: 0.3, scheduler:  DispatchQueue.main)
            .map { term in
                service.completion(.completion(text: term))
            }
            .switchToLatest()
            .map {$0.map(\.text)}
            .assign(to: &$completions)
    }
    
    func requestDetails(forID id: String, service: ApiService = .live) {

        service
            .details(.detail(id: id))
            .sink { _ in

            } receiveValue: { [weak self] business in
                let coor = CLLocationCoordinate2D(
                    latitude: business?.coordinates?.latitude ?? 0,
                    longitude: business?.coordinates?.longitude ?? 0
                )
                let region = MKCoordinateRegion(
                    center: coor,
                    span: .init(latitudeDelta: 0.001, longitudeDelta: 0.001)
                )
                self?.business = business
                self?.region = region
            }.store(in: &cancellables)
    }
    
    func save(business: Business, with context: NSManagedObjectContext) throws {
        let model = BarModel(context: context)
        model.id = business.id
        model.imageUrl = business.imageURL
        model.name = business.name
        model.category = business.formattedCategory
        model.rating = business.formattedRating
        try context.save()
    }
}
