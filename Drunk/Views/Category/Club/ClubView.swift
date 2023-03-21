
//
//  ClubView.swift
//  Drunk
//
//  Created by Yin-Lin Chen on 2023/3/3.
//

import SwiftUI

struct ClubView: View {
    @EnvironmentObject var viewModel: ClubViewModel
    @Environment(\.managedObjectContext) var context

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.businesses, id: \.id) {
                    business in
                    ZStack {
                        NavigationLink(destination: DetailClub(id: business.id!)) {
                            EmptyView().opacity(0).frame(width: 0)
                        }
                        BarCell(business: business)
                    }
                    .listRowSeparator(.hidden)

                }
                .listStyle(.plain)
                .navigationTitle(Text("🍾Night Club"))

            }
        }
        .navigationBarBackButtonHidden(false)
    }
}

struct ClubView_Previews: PreviewProvider {
    static var previews: some View {
        ClubView().environmentObject(ClubViewModel())
    }
}
