//
//  MenuDataCellEnum.swift
//  testMenuDzng
//
//  Created by michail on 15.05.2023.
//

import Foundation
import UIKit

enum MenuDataCellEnum: Int, CaseIterable {
    case personalDetails
    case limits
    case security
    case aboutUs
    
    var model: MenuCellModel {
        return MenuCellModel(title: title, image: image)
    }

    private var title: String {
        switch self {
        case .personalDetails:
            return "Personal details"
        case .limits:
            return "Limits"
        case .security:
            return "Security"
        case .aboutUs:
            return "About us"
        }
    }
    
    private var image: UIImage? {
        switch self {
        case .personalDetails:
            return AppAssets.personalDetails.image
        case .limits:
            return AppAssets.limits.image
        case .security:
            return AppAssets.security.image
        case .aboutUs:
            return AppAssets.aboutUs.image
        }
    }
}
