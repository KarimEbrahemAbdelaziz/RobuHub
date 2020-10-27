//
//  SearchViewController.swift
//  RobuHub
//
//  Created by KarimEbrahem on 10/27/20.
//

import UIKit

// MARK: - View Protocol

protocol SearchView: ViewProtocol {
    
}

// MARK: - Search ViewController

class SearchViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var repositoriesSearchBar: UISearchBar!
    @IBOutlet private weak var emptyStatusLabel: UILabel!

    // MARK: - Proprties

    var presenter: SearchPresenter?

    // MARK: View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.search(for: "sh", at: 1, countPerPage: 10)
    }

}

// MARK: - SearchView Protocol

extension SearchViewController: SearchView {
    
}

// MARK: - Themable Protocol

extension SearchViewController: Themable {
    func updateViewTheme() {
        
    }
}
