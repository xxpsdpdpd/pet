//
//  NSObject+Extensions.swift
//  testMenuDzng
//
//  Created by michail on 15.05.2023.
//

import Foundation

extension NSObject {
    
    var className: String {
        String(describing: type(of: self))
    }
    
    class var className: String {
        String(describing: self)
    }
}
