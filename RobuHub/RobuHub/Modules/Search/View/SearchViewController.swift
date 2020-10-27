//
//  SearchViewController.swift
//  RobuHub
//
//  Created by KarimEbrahem on 10/27/20.
//

import UIKit
import NetworkPlatform

// MARK: - View Protocol

protocol SearchView: ViewProtocol {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showEmptyStatus()
    func hideEmptyStatus()
    func updateRepositoriesList()
}

// MARK: - Search ViewController

class SearchViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var repositoriesTableView: UITableView!
    @IBOutlet private weak var repositoriesSearchBar: UISearchBar!
    @IBOutlet private weak var emptyStatusLabel: UILabel!

    // MARK: - Proprties

    var presenter: SearchPresenter?

    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViewTheme()
        setupRepositoriesTableView()
    }
    
    // MARK: - Private Functions
    
    private func setupRepositoriesTableView() {
        repositoriesTableView.register(UINib(nibName: "RepositoryCell", bundle: nil), forCellReuseIdentifier: "RepositoryCell")
    }

}

// MARK: - SearchView Protocol

extension SearchViewController: SearchView {
    func updateRepositoriesList() {
        hideEmptyStatus()
        repositoriesTableView.reloadData()
    }
    
    func showEmptyStatus() {
        repositoriesTableView.isHidden = true
        emptyStatusLabel.isHidden = false
    }
    
    func hideEmptyStatus() {
        repositoriesTableView.isHidden = false
        emptyStatusLabel.isHidden = true
    }
    
    func showLoadingIndicator() {
        
    }
    
    func hideLoadingIndicator() {
        
    }
}

// MARK: - Themable Protocol

extension SearchViewController: Themable {
    func updateViewTheme() {
        emptyStatusLabel.textColor = UIColor.lightGray
        emptyStatusLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
    }
}

// MARK: - UITableView DataSource

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRepositories ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath) as! RepositoryCell
        presenter?.configure(cell: cell, forRow: indexPath.row)
        
        return cell
    }
}

// MARK: - UITableView Delegate

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelect(row: indexPath.row)
    }
}

// MARK: - UISearchBar Delegate

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchRepositoryName = searchBar.text else { return }
        
        searchBar.endEditing(true)
        presenter?.search(for: searchRepositoryName)
    }
}
