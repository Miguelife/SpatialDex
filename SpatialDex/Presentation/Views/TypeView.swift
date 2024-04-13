//
//  TypeView.swift
//  SpatialDex
//
//  Created by Miguel Ángel Soto González on 7/4/24.
//

import SwiftUI

struct TypeView: View {
    let title: String
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Image(systemName: getImageNameByType())
            Text(title.capitalized)
            Spacer()
        }
        .padding(.bottom, 10)
    }
    
    func getImageNameByType() -> String {
        switch title {
        case "normal":
            return "circle.circle"
        case "fighting":
            return "hand.raised"
        case "flying":
            return "bird"
        case "poison":
            return "syringe"
        case "ground":
            return "globe.europe.africa"
        case "rock":
            return "mountain.2"
        case "bug":
            return "ant"
        case "ghost":
            return "waveform"
        case "steel":
            return "wrench.and.screwdriver"
        case "fire":
            return "flame"
        case "water":
            return "drop"
        case "grass":
            return "leaf"
        case "electric":
            return "bolt"
        case "psychic":
            return "brain"
        case "ice":
            return "snowflake"
        case "dragon":
            return "lizard"
        case "dark":
            return "moonphase.waning.crescent"
        case "fairy":
            return "sparkles"
        default:
            return ""
        }
    }
}

