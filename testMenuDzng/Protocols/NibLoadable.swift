//
//  NibLoadable.swift
//  testMenuDzng
//
//  Created by michail on 19.05.2023.
//

import Foundation
import UIKit

protocol NibLoadable {
    static var nibName: String { get }
}

extension NibLoadable where Self: UIView {
    static var nibName: String {
        String(describing: Self.self)
    }

    static var nib: UINib {
        UINib(nibName: Self.nibName, bundle: Bundle(for: Self.self))
    }

    func setupFromNib() {
        guard let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView else { fatalError("Error loading \(self) from nib") }
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        view.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
}
