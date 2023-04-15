//
//  SuperheroListProtocol.swift
//  SuperheroAPI
//
//  Created by Belén Cerezo on 19/10/22.
//

import Foundation

protocol SuperheroListViewProtocol {
    func updateView()
    func showError()
}

protocol SuperheroListViewModelProtocol {
    func viewDidLoad()
    func countSuperheroes() -> Int
    func getSuperheroeAtRow(_ row: Int) -> Superhero?
}
