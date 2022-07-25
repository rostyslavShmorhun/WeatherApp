//
//  SearchTableViewController.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 20.07.2022.
//

import UIKit

// MARK: - SearchTableViewProtocol
protocol SearchTableViewProtocol: AnyObject{
    
}

// MARK: - SearchTableViewController
final class SearchTableViewController: UITableViewController {

    var presenter: PresenterSearchTableViewController!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        presenter.getData()
        print(presenter.model)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}

// MARK: - SearchTableViewController
extension SearchTableViewController: SearchTableViewProtocol {
    
}
