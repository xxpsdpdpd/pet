//
//  MenuTableViewCell.swift
//  testMenuDzng
//
//  Created by michail on 15.05.2023.
//

import UIKit

protocol PMenuTableViewCell {
    func configureCell(model: MenuCellModel)
}

final class MenuTableViewCell: BaseTableViewCell {
    @IBOutlet private weak var bgContetView: UIView!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    private let cornerRadius: CGFloat = 10
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    private func configureView() {
        bgContetView.layer.cornerRadius = cornerRadius
    }
}

extension MenuTableViewCell: PMenuTableViewCell {
    func configureCell(model: MenuCellModel) {
        iconImageView.image = model.image
        titleLabel.text = model.title
    }
}
