//
//  CardView.swift
//  Drunk
//
//  Created by Yin-Lin Chen on 2023/3/5.
//

import SwiftUI

struct CardView: View {
    let business: Business
    var body: some View {
        VStack (alignment: .leading, spacing: 1) {
            Group {
                Text(business.formattedName)
                    .bold()
                    .font(.system(size: 20))
                Text(business.formattedCategories)
                    .font(.subheadline)
                    .padding(.medium)
                    .scaledToFit()
            }
            Group {
                HStack {
                    Image("map")
                    Text(business.formattedAddress)
                    Image("phone")
                    Text(business.formattedPhone)
                    
                }
            }
            Group {
                HStack {
                    Image("star")
                    Text(business.formattedRating)
                    Image("money")
                    Text(business.formattedPrice)
                    Image("clock")
                    Text(business.dayOfTheWeek)
                    Spacer()
                }
            }
            .padding(.medium)
            Group {
                TabView {
                    ForEach(business.images, id: \.self) {
                        url in AsyncImage.init(url: url) {
                            image in image.resizable().aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray
                        }
                    }
                }
                .frame(height: 240)
                .cornerRadius(.large)
                .tabViewStyle(.page)
            }
        }.padding().padding()
            .background(Color.orange)
            .cornerRadius(20)
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.65)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            business:
                    .init(
                        id: nil,
                        alias: nil,
                        name: "Three Dots and A Dash",
                        imageURL: "https://media.cntraveler.com/photos/5d76c2eab18b620008ca1300/16:9/w_2560,c_limit/Three-Dots-and-a-Dash_Melissa-Hom_Three_Dots_Interior_credit_Melissa_Hom.jpg",
                        isClaimed: nil,
                        isClosed: nil,
                        url: nil,
                        phone: nil,
                        displayPhone: "(312) 610-4220",
                        reviewCount: nil,
                        categories: [.init(alias: nil, title: "Cocktail Bar")],
                        rating: 4.5,
                        location: .init(address1: nil, address2: nil, address3: nil, city: nil, zipCode: nil, country: nil, state: nil, displayAddress: ["435 N Clark St"], crossStreets: nil),
                        coordinates: nil,
                        photos:[ "https://media.cntraveler.com/photos/5d76c2eab18b620008ca1300/16:9/w_2560,c_limit/Three-Dots-and-a-Dash_Melissa-Hom_Three_Dots_Interior_credit_Melissa_Hom.jpg","https://media.cntraveler.com/photos/5d76c2eab18b620008ca1300/16:9/w_2560,c_limit/Three-Dots-and-a-Dash_Melissa-Hom_Three_Dots_Interior_credit_Melissa_Hom.jpg"],
                        price: "$$",
                        hours: nil,
                        transactions: nil,
                        specialHours: nil
                    )
        )
    }
}
