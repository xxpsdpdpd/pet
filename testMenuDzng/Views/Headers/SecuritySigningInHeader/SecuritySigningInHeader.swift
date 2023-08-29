//
//  SecuritySigningInHeader.swift
//  testMenuDzng
//
//  Created by michail on 16.05.2023.
//

import UIKit

protocol PSecuritySigningInHeader {
    func setupHeaderData(model: ActionTableCellModel)
}

final class SecuritySigningInHeader: UITableViewHeaderFooterView {

    @IBOutlet private weak var sectionTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sectionTitleLabel.textColor = AppColors.limitsBronze.color
    }
}

extension SecuritySigningInHeader: PSecuritySigningInHeader {
    func setupHeaderData(model: ActionTableCellModel) {
        sectionTitleLabel.text = model.sectionTitle
    }
}
