//
//  CatView.swift
//  Drunk
//
//  Created by Yin-Lin Chen on 2023/3/7.
//

import SwiftUI

struct CatView: View {
    @EnvironmentObject var viewModel: BeerViewModel
    @EnvironmentObject var viewModel2: WineViewModel
    @EnvironmentObject var viewModel3: SpeakViewModel
    @EnvironmentObject var viewModel4: StoreViewModel
    @EnvironmentObject var viewModel5: ChardViewModel
    @EnvironmentObject var viewModel6: ClubViewModel

    var body: some View {
        NavigationView {
            List{
                NavigationLink (destination: BeerView()
                    .environmentObject(viewModel)
                    .environment(\.managedObjectContext,
                                  viewModel.container.viewContext)) {
                    HStack {
                        Text("🍺Beer")
                            .bold()
                            .font(.system(size: 30))
                            .padding(.small)
                            .padding(.horizontal, .medium)
                            .background(Color.orange)
                            .cornerRadius(20)
                            .shadow(radius: 2)
                            .foregroundColor(.black)
                    }
                }
                NavigationLink (destination: WineView()
                    .environmentObject(viewModel2)
                    .environment(\.managedObjectContext,
                                  viewModel2.container.viewContext)) {
                    HStack {
                        Text("🍷Wine")
                            .bold()
                            .font(.system(size: 30))
                            .padding(.small)
                            .padding(.horizontal, .medium)
                            .background(Color.red)
                            .cornerRadius(20)
                            .shadow(radius: 2)
                            .foregroundColor(.black)
                    }
                }
                NavigationLink (destination: ChardView()
                    .environmentObject(viewModel5)
                    .environment(\.managedObjectContext,
                                  viewModel5.container.viewContext)) {
                    HStack {
                        Text("🥂Chardonnay")
                            .bold()
                            .font(.system(size: 30))
                            .padding(.small)
                            .padding(.horizontal, .medium)
                            .background(Color.pink)
                            .cornerRadius(20)
                            .shadow(radius: 2)
                            .foregroundColor(.black)
                    }
                }
                NavigationLink (destination: SpeakView()
                    .environmentObject(viewModel3)
                    .environment(\.managedObjectContext,
                                  viewModel3.container.viewContext)) {
                    HStack {
                        Text("🍹Speakeasy")
                            .bold()
                            .font(.system(size: 30))
                            .padding(.small)
                            .padding(.horizontal, .medium)
                            .background(Color.yellow)
                            .cornerRadius(20)
                            .shadow(radius: 2)
                            .foregroundColor(.black)
                    }
                }
                NavigationLink (destination: StoreView()
                    .environmentObject(viewModel4)
                    .environment(\.managedObjectContext,
                                  viewModel4.container.viewContext)) {
                    HStack {
                        Text("🍸Liquor Store")
                            .bold()
                            .font(.system(size: 30))
                            .padding(.small)
                            .padding(.horizontal, .medium)
                            .background(Color.blue)
                            .cornerRadius(20)
                            .shadow(radius: 2)
                            .foregroundColor(.black)
                    }
                }
                NavigationLink (destination: ClubView()
                    .environmentObject(viewModel6)
                    .environment(\.managedObjectContext,
                                  viewModel6.container.viewContext)) {
                    HStack {
                        Text("🍾Night Clubs")
                            .bold()
                            .font(.system(size: 30))
                            .padding(.small)
                            .padding(.horizontal, .medium)
                            .background(Color.brown)
                            .cornerRadius(20)
                            .shadow(radius: 2)
                            .foregroundColor(.black)
                    }
                }
            }
            .navigationTitle("Categories")
        }
    }
}

struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        CatView()
            .environmentObject(BeerViewModel())
            .environmentObject(WineViewModel())
            .environmentObject(SpeakViewModel())
            .environmentObject(StoreViewModel())
            .environmentObject(ChardViewModel())
            .environmentObject(ClubViewModel())
    }
}
