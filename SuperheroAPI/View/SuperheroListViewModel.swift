//
//  SuperheroListViewModel.swift
//  SuperheroAPI
//
//  Created by Belén Cerezo on 19/10/22.
//

import Foundation

class SuperheroListViewModel {
    var view: SuperheroListViewProtocol
    let network: SuperheroNetworkProtocol = SuperheroNetwork()
    var superheroList: [Superhero] = []
    init(view: SuperheroListViewProtocol) {
        self.view = view
    }
    
    func getSuperhero() {
        network.getSuperhero { [weak self] superheroList in
            guard let superheroes = superheroList else {
                self?.view.showError()
                return
            }
            self?.superheroList.removeAll()
            self?.superheroList = superheroes
            self?.view.updateView()
        }
    }
}

extension SuperheroListViewModel: SuperheroListViewModelProtocol {
    func viewDidLoad() {
        getSuperhero()
    }

    func countSuperheroes() -> Int {
        superheroList.count
    }

    func getSuperheroeAtRow(_ row: Int) -> Superhero? {
        guard superheroList.count >= 0 else {
            return nil
        }
        return superheroList[row]
    }
}
