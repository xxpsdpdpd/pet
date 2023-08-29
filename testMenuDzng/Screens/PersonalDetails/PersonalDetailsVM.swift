//
//  PersonalDetailsVM.swift
//  testMenuDzng
//
//  Created by michail on 15.05.2023.
//

import Foundation

protocol PPersonalDetailsVM {
    var cellModels: [PersonalDetailsCellEnum] { get }
    func setupCellModels()
}

final class PersonalDetailsVM: PPersonalDetailsVM {
    
    weak var view: PPersonalDetailsVC?
    
    var cellModels: [PersonalDetailsCellEnum] = []
    
    func setupCellModels() {
        let firstName = "John"
        let lastName = "Smith"
        let dateOfBirth = "01/01/1990"
        let address = "52 Greencroft Gardens, NW63LU, Londo"
        let phone = "+447464540876"
        let email = "john.smith@gmail.com"
        
        cellModels = [
            PersonalDetailsCellEnum.fullName(createSpacing(args: firstName,lastName)),
            PersonalDetailsCellEnum.dateOfBirth(dateOfBirth),
            PersonalDetailsCellEnum.address(address),
            PersonalDetailsCellEnum.phoneNumber(phone),
            PersonalDetailsCellEnum.email(email)
        ]
    }
    
    private func createSpacing(args: String...) -> String {
        var result = ""
        args.forEach {
            result += $0 + " "
        }
        return result
    }
}
