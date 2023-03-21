
//
//  HomeView.swift
//  Drunk
//
//  Created by Yin-Lin Chen on 2023/3/3.
//

import SwiftUI

struct WineView: View {
    @EnvironmentObject var viewModel: WineViewModel
    @Environment(\.managedObjectContext) var context

    var body: some View {
        NavigationView {
            VStack {
                // list of bar
//                HStack {
//                    Image(systemName: "wineglass")
//                    Text("Recommend Cocktail Bar List").bold().foregroundColor(.orange)
//                    Image(systemName: "wineglass.fill")
//                }
                List(viewModel.businesses, id: \.id) {
                    business in
                    ZStack {
                        NavigationLink(destination: DetailWine(id: business.id!)) {
                            EmptyView().opacity(0).frame(width: 0)
                        }
                        BarCell(business: business)
                    }
                    .listRowSeparator(.hidden)

                }
                .listStyle(.plain)
                .navigationTitle(Text("🍷Wine"))

            }
//            .sheet(isPresented: $viewModel.show) {
//                FavoriteView()
//            }

        }
        .navigationBarBackButtonHidden(false)
        
    }
}

struct WineView_Previews: PreviewProvider {
    static var previews: some View {
        WineView().environmentObject(WineViewModel())
    }
}
