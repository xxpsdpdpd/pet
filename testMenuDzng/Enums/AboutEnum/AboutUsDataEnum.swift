//
//  AboutUsEnum.swift
//  testMenuDzng
//
//  Created by michail on 16.05.2023.
//

import Foundation

enum AboutUsDataEnum: Int, CaseIterable {
    case securityPrivacy
    case termsConditions
    
    var model: ActionTableCellModel {
        ActionTableCellModel(cellTitle: title)
    }
    
    private var title: String {
        switch self {
        case .securityPrivacy:
            return "Security and Privacy Policy"
        case .termsConditions:
            return "Terms and Conditions"
        }
    }
}
