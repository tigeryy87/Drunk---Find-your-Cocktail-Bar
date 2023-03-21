//
//  FoodCategories.swift
//  Drunk
//
//  Created by Yin-Lin Chen on 2023/3/3.
//

import Foundation

enum FoodCategory: String, CaseIterable, Equatable, Identifiable{
    var id: String {self.rawValue}
    case alcohol
    case coffee
    case beer
    case wine
    case breakfeast
    case donuts

    var emoji: String {
        switch self {
        case .alcohol:
            return "\u{1F379}"
        case .coffee:
            return "\u{1F378}"
        case .beer:
            return "\u{1F37A}"
        case .wine:
            return "\u{1F377}"
        case .breakfeast:
            return "\u{1F95E}"
        case .donuts:
            return "\u{1F369}"
        }
    }

    var alias: String {
        switch self {
        case .alcohol:
            return "r"
        case .coffee:
            return "coffee"
        case .beer:
            return "beer"
        case .wine:
            return "wine"
        case .breakfeast:
            return "breakfast_brunch"
        case .donuts:
            return "donuts"
        }
    }
}
