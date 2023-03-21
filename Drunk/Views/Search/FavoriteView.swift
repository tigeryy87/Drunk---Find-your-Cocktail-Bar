//
//  FavoriteView.swift
//  Drunk
//
//  Created by Yin-Lin Chen on 2023/3/6.
//
import CoreData
import SwiftUI

struct FavoriteView: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
        entity: BarModel.entity(),
        sortDescriptors: [],
        animation: .easeInOut
    ) var barModels: FetchedResults<BarModel>
    
    var businesses: [Business] {
        barModels.map(Business.init(model:))
    }
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("Favorite")
                    .font(.title)
                    .bold()
                    .padding()
                Divider()
                List(businesses, id: \.id) { business in
                    BarCell(business: business)
                        .swipeActions(edge: .trailing,
                                      allowsFullSwipe: true) {
                            Button("Delete", role: .destructive) {
                                if let id = business.id {
                                    delete(for: id)
                                }
                            }
                        }
                }.listStyle(.plain)
                Spacer()
            }
            
        }
        

    }
    
    func delete(for id: String) {
        if let model = barModels
            .first(where: { $0.id == id}) {
            context.delete(model)
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
