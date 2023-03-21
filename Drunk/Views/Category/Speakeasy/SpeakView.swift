
//
//  SpeakView.swift
//  Drunk
//
//  Created by Yin-Lin Chen on 2023/3/3.
//

import SwiftUI

struct SpeakView: View {
    @EnvironmentObject var viewModel: SpeakViewModel
    @Environment(\.managedObjectContext) var context

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.businesses, id: \.id) {
                    business in
                    ZStack {
                        NavigationLink(destination: DetailSpeak(id: business.id!)) {
                            EmptyView().opacity(0).frame(width: 0)
                        }
                        BarCell(business: business)
                    }
                    .listRowSeparator(.hidden)

                }
                .listStyle(.plain)
                .navigationTitle(Text("🍹Speakeasy Bar"))

            }
        }
        .navigationBarBackButtonHidden(false)
    }
}

struct SpeakView_Previews: PreviewProvider {
    static var previews: some View {
        SpeakView().environmentObject(SpeakViewModel())
    }
}
