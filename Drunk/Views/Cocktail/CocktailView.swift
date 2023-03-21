
//
//  HomeView.swift
//  Drunk
//
//  Created by Yin-Lin Chen on 2023/3/3.
//

import SwiftUI

struct CocktailView: View {
    @EnvironmentObject var viewModel: CocktailViewModel
    @Environment(\.managedObjectContext) var context

    var body: some View {
        NavigationView {
            VStack {
                // list of bar
                HStack {
                    Image(systemName: "wineglass")
                    Text("Recommend Cocktail Bar List").bold().foregroundColor(.orange)
                    Image(systemName: "wineglass.fill")
                }
                List(viewModel.businesses, id: \.id) {
                    business in
                    ZStack {
                        NavigationLink(destination: DetailBar(id: business.id!)) {
                            EmptyView().opacity(0).frame(width: 0)
                        }
                        BarCell(business: business)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .navigationTitle(Text("Chicago Cocktail Bar"))
            }
            .sheet(isPresented: $viewModel.show) {
                FavoriteView()
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

struct CocktailView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailView().environmentObject(CocktailViewModel())
    }
}
