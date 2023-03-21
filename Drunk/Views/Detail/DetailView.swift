//
//  DetailView.swift
//  Drunk
//
//  Created by Yin-Lin Chen on 2023/3/5.
//

import SwiftUI
import MapKit

struct DetailView: View {
    let id: String
    @EnvironmentObject var viewModel: MainViewModel
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        ZStack (alignment: .top) {
            //MAP
            Rectangle().fill(Color.clear)
            Map(coordinateRegion: $viewModel.region, annotationItems: viewModel.business != nil ? viewModel.business!.mapItems: []) {
                MapMarker(coordinate: $0.coordinate, tint: .blue)
            }
                .frame(height: UIScreen.main.bounds.height * 0.50)
            
        }.overlay(
            //Card
            viewModel.business != nil ?
            CardView(business: viewModel.business!): nil,
            alignment: .bottom
        )
        .ignoresSafeArea(edges: [.top, .bottom])
        .onAppear {
            viewModel.requestDetails(forID: id)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {presentationMode.wrappedValue.dismiss()}) {
                    Image(systemName: "chevron.backward.circle.fill")
                        .font(.title)
                }
                .tint(.orange)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id: "WavvLdfdP6g8aZTtbBQHTw").environmentObject(MainViewModel())
    }
}
