//
//  PersonalDetailsCellEnum.swift
//  testMenuDzng
//
//  Created by michail on 15.05.2023.
//

import Foundation

enum PersonalDetailsCellEnum {
    case fullName(String)
    case dateOfBirth(String)
    case address(String)
    case phoneNumber(String)
    case email(String)
    
    var model: PersonalDetailsCellModel {
        PersonalDetailsCellModel(userData: data, title: title)
    }
    
    private var title: String {
        switch self {
        case .fullName:
            return "Full name"
        case .dateOfBirth:
            return "Date of birth"
        case .address:
            return "Residential address"
        case .phoneNumber:
            return "Phone number"
        case .email:
            return "E-mail"
        }
    }
    
    private var data: String {
        switch self {
        case .fullName(let fullNameModel):
            return fullNameModel
        case .dateOfBirth(let dateOfBirthModel):
            return dateOfBirthModel
        case .address(let addressModel):
            return addressModel
        case .phoneNumber(let phoneNumberModel):
            return phoneNumberModel
        case .email(let emailModel):
            return emailModel
        }
    }
}
