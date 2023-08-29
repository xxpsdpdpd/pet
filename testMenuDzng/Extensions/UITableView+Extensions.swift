//
//  UITableView+Extensions.swift
//  testMenuDzng
//
//  Created by michail on 15.05.2023.
//

import UIKit

extension UITableView {
    
    func registerCell(ofType type: UITableViewCell.Type) {
       register(UINib(nibName: type.className, bundle: nil), forCellReuseIdentifier: type.className)
    }
    
    func dequeueCell<T>(ofType type: T.Type) -> T? where T: UITableViewCell {
        dequeueReusableCell(withIdentifier: T.className) as? T
    }
    
    func registerHeaderFooterView(ofType type: UITableViewHeaderFooterView.Type) {
       register(UINib(nibName: type.className, bundle: nil), forHeaderFooterViewReuseIdentifier: type.className)
    }
    
    func dequeueHeaderFooterView<T>(ofType type: T.Type) -> T? where T: UITableViewHeaderFooterView {
        dequeueReusableHeaderFooterView(withIdentifier: T.className) as? T
    }
}
