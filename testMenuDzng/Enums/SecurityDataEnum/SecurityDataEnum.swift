//
//  SecurityDataEnum.swift
//  testMenuDzng
//
//  Created by michail on 16.05.2023.
//

import UIKit

enum SecurityDataEnum: Int, CaseIterable {
    case changePasscode
    case signingIn
    
    var model: ActionTableCellModel {
        ActionTableCellModel(cellTitle: titleCell, sectionTitle: titleSection)
    }
    
    private var titleSection: String {
        switch self {
        case .changePasscode:
            return ""
        case .signingIn:
            return "Signing In"
        }
    }
    
    private var titleCell: String {
        switch self {
        case .changePasscode:
            return "Change passcode"
        case .signingIn:
            return "Sign in with Biometric ID"
        }
    }
    
    var heightForHeader: CGFloat {
        switch self {
        case .changePasscode:
            return .zero
        case .signingIn:
            return 50
        }
    }
}
