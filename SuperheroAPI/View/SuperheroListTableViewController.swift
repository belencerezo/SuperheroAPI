//
//  SuperheroListTableViewController.swift
//  SuperheroAPI
//
//  Created by Belén Cerezo on 19/10/22.
//

import UIKit

class SuperheroListTableViewController: UITableViewController {
    
    var viewModel: SuperheroListViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SuperheroListViewModel(view: self)
        
        tableView.register(UINib(nibName: "SuperheroListTableViewCell", bundle: nil), forCellReuseIdentifier: SuperheroListTableViewCell.cellId)

        viewModel.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countSuperheroes()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SuperheroListTableViewCell.cellId, for: indexPath) as! SuperheroListTableViewCell

        if let superhero = viewModel.getSuperheroeAtRow(indexPath.row) {
            cell.updateWithSuperhero(superhero)
        }
        return cell
    }
}

extension SuperheroListTableViewController: SuperheroListViewProtocol {
    func updateView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showError() {
        //TODO
    }
}
