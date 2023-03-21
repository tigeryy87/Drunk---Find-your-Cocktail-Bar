//
//  HomeView.swift
//  Drunk
//
//  Created by Yin-Lin Chen on 2023/3/3.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @Environment(\.managedObjectContext) var context

    var body: some View {
        NavigationView {
            VStack {
                Text("(Searching among Chicago's restaurant)")
                    .bold()
                // Category
//                Group {
//                    Text("Categories")
//                        .bold()
//                        .padding(.leading, .large)
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack {
//                            ForEach(FoodCategory.allCases, id: \.self) { category in
//                                CategoryView(selectedCategory: $viewModel.selectedCategory, category: category)
//                            }
//                        }.padding(.small)
//                    }
//                }
                // list of bar
                List(viewModel.businesses, id: \.id) {
                    business in
                    ZStack {
                        NavigationLink(destination: DetailView(id: business.id!)) {
                            EmptyView().opacity(0).frame(width: 0)
                        }
                        BarCell(business: business)
                    }
                    .listRowSeparator(.hidden)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button("Save") {
                            // save
                            do {
                                try viewModel.save(business: business, with: context)
                                print("saved")
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
                .listStyle(.insetGrouped)
                .navigationTitle(Text("🖤Swipe to Favorite"))
                .searchable(text: $viewModel.searchText, prompt: Text("Search bar...")) {
                    ForEach(viewModel.completions, id: \.self) {
                        completion in
                        Text(completion)
                            .searchCompletion(completion)
                    }
                    }
                .toolbar {
                    ToolbarItem(placement:
                            .navigationBarTrailing) {
                                Button(action: {
                                    viewModel.show.toggle()
                                }) {
                                    Image(systemName: "heart")
                                }
                                
                            }
                }
//                .safeAreaInset(edge: .bottom) {
//                    Rectangle()
//                        .fill(LinearGradient(colors: [.white, .white.opacity(0)], startPoint: .bottom, endPoint: .top))
//                        .frame(height: 90)
//                }
//                .edgesIgnoringSafeArea(.bottom)
            }
            .sheet(isPresented: $viewModel.show) {
                FavoriteView()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(MainViewModel())
    }
}
