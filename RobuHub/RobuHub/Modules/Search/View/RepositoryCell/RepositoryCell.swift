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

    @IBOutlet private weak var repositoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func display(repoName: String, ownerName: String, ownerImageUrl: String, creationDate: String) {
        repositoryNameLabel.text = repoName
    }
    
}

extension RepositoryCell: Themable {
    func updateViewTheme() {
        repositoryNameLabel.textColor = .black
        repositoryNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }
}
