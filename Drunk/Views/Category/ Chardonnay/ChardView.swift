
//
//  ChardView.swift
//  Drunk
//
//  Created by Yin-Lin Chen on 2023/3/3.
//

import SwiftUI

struct ChardView: View {
    @EnvironmentObject var viewModel: ChardViewModel
    @Environment(\.managedObjectContext) var context

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.businesses, id: \.id) {
                    business in
                    ZStack {
                        NavigationLink(destination: DetailChard(id: business.id!)) {
                            EmptyView().opacity(0).frame(width: 0)
                        }
                        BarCell(business: business)
                    }
                    .listRowSeparator(.hidden)

                }
                .listStyle(.plain)
                .navigationTitle(Text("🥂Chardonnay"))

            }
        }
        .navigationBarBackButtonHidden(false)
    }
}

struct ChardView_Previews: PreviewProvider {
    static var previews: some View {
        ChardView().environmentObject(ChardViewModel())
    }
}
