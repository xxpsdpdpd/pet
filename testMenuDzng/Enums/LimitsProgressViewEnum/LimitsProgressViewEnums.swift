//
//  LimitsProgressViewEnums.swift
//  testMenuDzng
//
//  Created by michail on 16.05.2023.
//

import UIKit

enum ProgressAnimationKeys: String {
    case strokeEnd
    case strokeEndAnimation
}

enum ProgressViewType {
    case progress
    case background
    
    var color: CGColor {
        switch self {
        case .progress:
            return AppColors.limitsBronze.color.cgColor
        case .background:
            return AppColors.mainLightColor.color.cgColor
        }
    }
}

enum ProgressViewLabelType {
    case limit
    case perMonth
    
    var textColor: UIColor {
        switch self {
        case .limit:
            return AppColors.limitsBronze.color
        case .perMonth:
            return .black
        }
    }
    
    var font: UIFont {
        switch self {
        case .limit:
            return UIFont.systemFont(ofSize: 26)
        case .perMonth:
            return UIFont.systemFont(ofSize: 16)
        }
    }
    
    var text: String {
        switch self {
        case .limit:
            return ""
        case .perMonth:
            return "per month"
        }
    }
}
