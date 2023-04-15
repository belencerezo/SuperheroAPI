//
//  Superhero.swift
//  SuperheroAPI
//
//  Created by Belén Cerezo on 19/10/22.
//

import Foundation

struct Superhero: Codable {
    let id: Int?
    let name: String?
    let biography: Biography?
    let images: Image?
}
