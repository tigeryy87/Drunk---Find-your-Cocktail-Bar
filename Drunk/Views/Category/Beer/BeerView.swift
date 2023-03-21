
//
//  BeerView.swift
//  Drunk
//
//  Created by Yin-Lin Chen on 2023/3/3.
//

import SwiftUI

struct BeerView: View {
    @EnvironmentObject var viewModel: BeerViewModel
    @Environment(\.managedObjectContext) var context

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.businesses, id: \.id) {
                    business in
                    ZStack {
                        NavigationLink(destination: DetailBeer(id: business.id!)) {
                            EmptyView().opacity(0).frame(width: 0)
                        }
                        BarCell(business: business)
                    }
                    .listRowSeparator(.hidden)

                }
                .listStyle(.plain)
                .navigationTitle(Text("🍻Beer"))

            }
        }
        .navigationBarBackButtonHidden(false)
    }
}

struct BeerView_Previews: PreviewProvider {
    static var previews: some View {
        BeerView().environmentObject(BeerViewModel())
    }
}
