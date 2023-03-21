

//
//  DetailClub.swift
//  Drunk
//
//  Created by Yin-Lin Chen on 2023/3/5.
//

import SwiftUI
import MapKit

struct DetailClub: View {
    let id: String
    @EnvironmentObject var viewModel: ClubViewModel
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
        .navigationBarBackButtonHidden(true)
    }
}


struct DetailClub_Previews: PreviewProvider {
    static var previews: some View {
        DetailClub(id: "WavvLdfdP6g8aZTtbBQHTw").environmentObject(ClubViewModel())
    }
}
