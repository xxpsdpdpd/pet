//
//  NavigationViewProtocols.swift
//  testMenuDzng
//
//  Created by michail on 18.05.2023.
//

import Foundation
import UIKit

protocol NavigationBarActions: AnyObject {
    func dissmis()
    func rightButtonAction()
}

protocol PNavigationBarVew {
    func setActionButtonImage(image: UIImage)
    func setupTitle(text: String)
}
