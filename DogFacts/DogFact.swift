//
//  DogFact.swift
//  DogFacts
//
//  Created by Nana Adwoa Odeibea Amoah on 7/11/21.
//

import Foundation

struct DogFact: Codable {
    var fact = ""
    
    enum CodingKeys: String, CodingKey {
        case fact
    }
}
