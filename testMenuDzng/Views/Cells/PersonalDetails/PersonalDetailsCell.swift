//
//  PersonalDetailsCell.swift
//  testMenuDzng
//
//  Created by michail on 15.05.2023.
//

import UIKit

protocol PPersonalDetailsCell {
    func configureCell(model: PersonalDetailsCellModel)
}

final class PersonalDetailsCell: BaseTableViewCell {

    @IBOutlet private weak var dataTitle: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension PersonalDetailsCell: PPersonalDetailsCell {
    func configureCell(model: PersonalDetailsCellModel) {
        dataTitle.text = model.userData
        titleLabel.text = model.title
    }
}
