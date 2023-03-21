//
//  TabBar.swift
//  Drunk
//
//  Created by Yin-Lin Chen on 2023/3/7.
//

import SwiftUI

struct TabBar: View {
    let viewModel = MainViewModel()
    let viewModel2 = CocktailViewModel()
    let viewModel3 = BeerViewModel()
    let viewModel4 = WineViewModel()
    let viewModel5 = SpeakViewModel()
    let viewModel6 = StoreViewModel()
    let viewModel7 = ChardViewModel()
    let viewModel8 = ClubViewModel()
    
    var body: some View {
        TabView {

            CocktailView()
                .environmentObject(viewModel2)
                .environment(\.managedObjectContext,
                            viewModel2.container.viewContext)
                .tabItem {
                    Label("Main", systemImage: "house")
                }
            MainView()
                .environmentObject(viewModel)
                .environment(\.managedObjectContext,
                            viewModel.container.viewContext)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            CatView()
                .environmentObject(viewModel3)
                .environment(\.managedObjectContext,
                            viewModel3.container.viewContext)
                .environmentObject(viewModel4)
                .environment(\.managedObjectContext,
                            viewModel4.container.viewContext)
                .environmentObject(viewModel5)
                .environment(\.managedObjectContext,
                            viewModel5.container.viewContext)
                .environmentObject(viewModel6)
                .environment(\.managedObjectContext,
                            viewModel6.container.viewContext)
                .environmentObject(viewModel7)
                .environment(\.managedObjectContext,
                            viewModel7.container.viewContext)
                .environmentObject(viewModel8)
                .environment(\.managedObjectContext,
                            viewModel8.container.viewContext)
                .tabItem {
                    Label("Category", systemImage: "slider.horizontal.3")
                }

//                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
