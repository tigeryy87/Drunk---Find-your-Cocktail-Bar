//
//  BarCell.swift
//  Drunk
//
//  Created by Yin-Lin Chen on 2023/3/4.
//

import SwiftUI

struct BarCell: View {
    
    let business: Business
    
    var body: some View {
        
        HStack{
            // Image
            AsyncImage(url: business.formattedImageUrl) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 150, height: 110)
            .cornerRadius(10)
            .padding(.small)
            
            // Label
            VStack (alignment: .leading, spacing: .small) {
                Text(business.formattedName).bold()
                Text(business.formattedCategory)
                HStack {
                    Image("star")
                    Text(business.formattedRating)
                    Image("money")
                    Text(business.formattedPrice)
                    
                }
            }
            Spacer()
        }
    }
}

struct BarCell_Previews: PreviewProvider {
    static var previews: some View {
        BarCell(
            business: .init(
                id: nil,
                alias: nil,
                name: "Three Dots and A Dash",
                imageURL: "https://media.cntraveler.com/photos/5d76c2eab18b620008ca1300/16:9/w_2560,c_limit/Three-Dots-and-a-Dash_Melissa-Hom_Three_Dots_Interior_credit_Melissa_Hom.jpg",
                isClaimed: nil,
                isClosed: nil,
                url: nil,
                phone: nil,
                displayPhone: nil,
                reviewCount: nil,
                categories: [.init(alias: nil, title: "Cocktail Bar")],
                rating: 4.5,
                location: nil,
                coordinates: nil,
                photos: nil,
                price: "$$",
                hours: nil,
                transactions: nil,
                specialHours: nil
            )
        )
    }
}
