//
//  RepositoryDetailsViewController.swift
//  RobuHub
//
//  Created by KarimEbrahem on 10/27/20.
//

import UIKit

protocol RepositoryDetailsView: ViewProtocol {
    func setOwnerImage(url: String)
    func setOwnerName(name: String)
    func setRepositoryName(name: String)
    func setRepositoryForksNumber(count: String)
    func setRepositoryStarsNumber(count: String)
}

class RepositoryDetailsViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet private weak var ownerImageView: UIImageView!
    @IBOutlet private weak var ownerNameLabel: UILabel!
    @IBOutlet private weak var repositoryNameLabel: UILabel!
    @IBOutlet private weak var repositoryForksNumberLabel: UILabel!
    @IBOutlet private weak var repositoryStarsNumberLabel: UILabel!
    
    // MARK: - Proprties
    
    var presenter: RepositoryDetailsPresenter?
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
    
    // MARK: - Private Functions
    
    private func setupUI() {
        ownerImageView.clipsToBounds = true
        ownerImageView.layer.cornerRadius = 100.0
    }

}

// MARK: - RepositoryDetailsView Protocol

extension RepositoryDetailsViewController: RepositoryDetailsView {
    func updateViewTheme() {
        
    }
    
    func setOwnerImage(url: String) {
        ownerImageView.setImage(from: url)
    }
    
    func setOwnerName(name: String) {
        ownerNameLabel.text = name
    }
    
    func setRepositoryName(name: String) {
        repositoryNameLabel.text = name
    }
    
    func setRepositoryForksNumber(count: String) {
        repositoryForksNumberLabel.text = count
    }
    
    func setRepositoryStarsNumber(count: String) {
        repositoryStarsNumberLabel.text = count
    }
}
