//
//  SuperheroNetworkProtocol.swift
//  SuperheroAPI
//
//  Created by Belén Cerezo on 19/10/22.
//

import Foundation

protocol SuperheroNetworkProtocol {
    func getSuperhero(completion: @escaping([Superhero]?) -> ())
}
