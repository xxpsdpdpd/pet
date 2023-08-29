//
//  BiometricCell.swift
//  testMenuDzng
//
//  Created by michail on 16.05.2023.
//

import UIKit

protocol PBiometricCell {
    func setupCellData(model: ActionTableCellModel)
}

final class BiometricCell: BaseTableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction private func switchAction() {
        
    }
}

extension BiometricCell: PBiometricCell {
    func setupCellData(model: ActionTableCellModel) {
        titleLabel.text = model.cellTitle
    }
}
