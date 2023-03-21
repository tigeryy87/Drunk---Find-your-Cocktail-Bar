//
//  CategoryView.swift
//  Drunk
//
//  Created by Yin-Lin Chen on 2023/3/4.
//

import SwiftUI

struct CategoryView: View {

    @Binding var selectedCategory: FoodCategory
    let category: FoodCategory
    
    var body: some View {
        Button(action: {selectedCategory = category}) {
            HStack{
                Text(category.emoji)
                    .font(.title)
                Text(category.rawValue.capitalized)
                    .bold()
                    
            }
        }
        .padding(.small)
        .padding(.horizontal, .medium)
        .background(selectedCategory == category ? Color.orange : .white)
        .cornerRadius(20)
        .shadow(radius: 2)
        .foregroundColor(.black)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(selectedCategory: .constant(.beer), category: .beer)
    }
}
