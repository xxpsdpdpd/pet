//
//  ActionTableCellModel.swift
//  testMenuDzng
//
//  Created by michail on 16.05.2023.
//

import Foundation

struct ActionTableCellModel {
    let cellTitle: String
    let sectionTitle: String?
    
    init(cellTitle: String, sectionTitle: String?) {
        self.cellTitle = cellTitle
        self.sectionTitle = sectionTitle
    }
}

extension ActionTableCellModel {
    init(cellTitle: String) {
        self.cellTitle = cellTitle
        self.sectionTitle = nil
    }
}
