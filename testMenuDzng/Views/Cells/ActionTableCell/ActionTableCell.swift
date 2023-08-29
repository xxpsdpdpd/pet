//
//  ActionTableCell.swift
//  testMenuDzng
//
//  Created by michail on 16.05.2023.
//

import UIKit

protocol PActionTableCell {
    func setupCell(model: ActionTableCellModel)
}

final class ActionTableCell: BaseTableViewCell {
    @IBOutlet private weak var bgView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    private let cornerRadius: CGFloat = 10
    private let borderWidth: CGFloat = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    private func configureView() {
        bgView.layer.cornerRadius = cornerRadius
        bgView.layer.borderWidth = borderWidth
        bgView.layer.borderColor = AppColors.mainLightColor.color.cgColor
    }
}

extension ActionTableCell: PActionTableCell {
    func setupCell(model: ActionTableCellModel) {
        titleLabel.text = model.cellTitle
    }
}
