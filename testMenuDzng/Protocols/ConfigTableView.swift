//
//  ConfigTableView.swift
//  testMenuDzng
//
//  Created by michail on 17.05.2023.
//

import Foundation
import UIKit

protocol ConfigTableViewCell {
    func configureCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}

protocol ConfigTableViewHeader {
    func setupHeaderTableView(tableView: UITableView, section: Int) -> UIView?
}
