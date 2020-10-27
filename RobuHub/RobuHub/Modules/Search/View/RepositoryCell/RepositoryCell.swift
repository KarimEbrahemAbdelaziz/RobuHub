//
//  RepositoryCell.swift
//  RobuHub
//
//  Created by KarimEbrahem on 10/27/20.
//

import UIKit

protocol RepositoryCellView {
    func display(repoName: String, ownerName: String, ownerImageUrl: String, creationDate: String)
}

class RepositoryCell: UITableViewCell, RepositoryCellView {

    @IBOutlet private weak var corneredView: UIView!
    @IBOutlet private weak var repositoryNameLabel: UILabel!
    @IBOutlet private weak var repositoryCreatedLabel: UILabel!
    @IBOutlet private weak var repositoryOwnerNameLabel: UILabel!
    @IBOutlet private weak var repositoryOwnerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateViewTheme()
    }

    func display(repoName: String, ownerName: String, ownerImageUrl: String, creationDate: String) {
        repositoryNameLabel.text = repoName
        repositoryOwnerNameLabel.text = ownerName
        repositoryOwnerImageView.setImage(from: ownerImageUrl)
        repositoryCreatedLabel.text = creationDate
    }
    
}

extension RepositoryCell: Themable {
    func updateViewTheme() {
        corneredView.layer.cornerRadius = 16.0
        repositoryOwnerImageView.layer.cornerRadius = 20.0
        repositoryOwnerImageView.clipsToBounds = true
        repositoryNameLabel.textColor = .black
        repositoryNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }
}
