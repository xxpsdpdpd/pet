//
//  TermsEnum.swift
//  testMenuDzng
//
//  Created by michail on 18.05.2023.
//

import Foundation

enum TermsType: Int {
    case privacyPolicy
    case termsAndConditions
    
    var url: URL? {
        switch self {
        case .privacyPolicy:
            return URL(string: "http://your-url.com/")
        case .termsAndConditions:
            return URL(string: "http://your-url.com/")
        }
    }
    
    var termsTitle: String {
        switch self {
        case .privacyPolicy:
            return "Privacy Policy"
        case .termsAndConditions:
            return "Terms and Conditions"
        }
    }
}
