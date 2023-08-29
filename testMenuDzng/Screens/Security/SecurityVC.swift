//
//  SecurityVC.swift
//  testMenuDzng
//
//  Created by michail on 16.05.2023.
//

import UIKit

protocol PSecurityVC: AnyObject {
    
}

final class SecurityVC: BaseVC, PSecurityVC {

    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: PSecurityVM?
    
    private let numberOfItemInSection: Int = 1
    private let navigationTitle = "Security"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        navigationViewTitle = navigationTitle
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCell(ofType: ActionTableCell.self)
        tableView.registerCell(ofType: BiometricCell.self)
        tableView.registerHeaderFooterView(ofType: SecuritySigningInHeader.self)
    }
}

extension SecurityVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        SecurityDataEnum.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfItemInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        configureCell(tableView: tableView, indexPath: indexPath)
    }
}

extension SecurityVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        setupHeaderTableView(tableView: tableView, section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        SecurityDataEnum(rawValue: section)?.heightForHeader ?? .zero
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}

extension SecurityVC: ConfigTableViewHeader {
    func setupHeaderTableView(tableView: UITableView, section: Int) -> UIView? {
        guard section == SecurityDataEnum.signingIn.rawValue,
              let model = SecurityDataEnum(rawValue: section)?.model
        else {
            return nil
        }
        let header = tableView.dequeueHeaderFooterView(ofType: SecuritySigningInHeader.self)
        header?.setupHeaderData(model: model)
        return header
    }
}

extension SecurityVC: ConfigTableViewCell {
    func configureCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let type = SecurityDataEnum(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        switch type {
        case .changePasscode:
            if let actionCell = tableView.dequeueCell(ofType: ActionTableCell.self) {
                actionCell.setupCell(model: type.model)
                return actionCell
            }
        case .signingIn:
            if let biometricCell = tableView.dequeueCell(ofType: BiometricCell.self) {
                biometricCell.setupCellData(model: type.model)
                return biometricCell
            }
        }
    
        return UITableViewCell()
    }
}
