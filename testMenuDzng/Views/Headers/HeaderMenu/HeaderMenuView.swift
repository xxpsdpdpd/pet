//
//  CustomHeader.swift
//  testMenuDzng
//
//  Created by michail on 15.05.2023.
//

import UIKit

protocol PHeaderMenuView {
    func configureView(model: HeaderMenuModel)
}

final class HeaderMenuView: UITableViewHeaderFooterView {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var avatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    private func configureView() {
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.height / 2
    }
}

extension HeaderMenuView: PHeaderMenuView {
    func configureView(model: HeaderMenuModel) {
        nameLabel.text = model.name
        avatarImageView.image = model.image
    }
}
