
//
//  StoreView.swift
//  Drunk
//
//  Created by Yin-Lin Chen on 2023/3/3.
//

import SwiftUI

struct StoreView: View {
    @EnvironmentObject var viewModel: StoreViewModel
    @Environment(\.managedObjectContext) var context

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.businesses, id: \.id) {
                    business in
                    ZStack {
                        NavigationLink(destination: DetailStore(id: business.id!)) {
                            EmptyView().opacity(0).frame(width: 0)
                        }
                        BarCell(business: business)
                    }
                    .listRowSeparator(.hidden)

                }
                .listStyle(.plain)
                .navigationTitle(Text("🍸Liquor Store"))

            }
        }
        .navigationBarBackButtonHidden(false)
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView().environmentObject(StoreViewModel())
    }
}
