//
//  AppAssets.swift
//  testMenuDzng
//
//  Created by michail on 19.05.2023.
//

import Foundation
import UIKit

enum AppAssets: String {
    case navigationBackButtonIcon = "navigationBackButtonIcon"
    case activeCircle = "passcodeCircleActive"
    case inactiveCircle = "passcodeCircleInactive"
    case arrowDownBlue = "arrowDownBlue"
    
    case personalDetails = "personalDetailsIcon"
    case limits = "limitsMidIcon"
    case security = "securityIcon"
    case aboutUs = "aboutUsIcon"
    
    case chevron = "chevronIcon"
    case support = "supportIcon"
    case share = "shareIcon"
    case rightArrow = "rightArrowIcon"

    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
}
