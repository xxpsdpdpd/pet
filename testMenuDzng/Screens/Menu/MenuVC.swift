//
//  MenuVC.swift
//  testMenuDzng
//
//  Created by michail on 15.05.2023.
//

import UIKit

protocol PMenuVC: AnyObject {
    
}

final class MenuVC: BaseVC, PMenuVC {
    @IBOutlet private weak var tableView: UITableView!
    
    private let heightForHeader: CGFloat = 180
    private let navigationTitle = "Menu"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {
        configureTableView()
        navigationViewTitle = navigationTitle
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerCell(ofType: MenuTableViewCell.self)
        tableView.registerHeaderFooterView(ofType: HeaderMenuView.self)
    }
}

extension MenuVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCell(at: indexPath.row)
    }
}

extension MenuVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MenuDataCellEnum.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        configureCell(tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        setupHeaderTableView(tableView: tableView, section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        heightForHeader
    }
}

extension MenuVC: ConfigTableViewHeader {
    func setupHeaderTableView(tableView: UITableView, section: Int) -> UIView? {
        let header = tableView.dequeueHeaderFooterView(ofType: HeaderMenuView.self)
        let model = HeaderMenuModel(name: "qeweqwe", image: AppAssets.personalDetails.image)
        header?.configureView(model: model)
        return header
    }
}

extension MenuVC: ConfigTableViewCell {
    func configureCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let menuCell = tableView.dequeueCell(ofType: MenuTableViewCell.self) else {
            return UITableViewCell()
        }
        
        guard let model = MenuDataCellEnum(rawValue: indexPath.row)?.model else {
            return UITableViewCell()
        }
        
        menuCell.configureCell(model: model)
        return menuCell
    }
}

fileprivate extension MenuVC {
    func selectedCell(at row: Int) {
        let cellMenu = MenuDataCellEnum(rawValue: row)

        switch cellMenu {
        case .personalDetails:
            let vc = PersonalDetailsVC()
            let vm = PersonalDetailsVM()
            vc.viewModel = vm
            vm.view = vc
            push(vc: vc)
        case .limits:
            let vc = LimitsVC()
            _ = LimitsVM()
            push(vc: vc)
        case .security:
            let vc = SecurityVC()
            push(vc: vc)
        case .aboutUs:
            let vc = AboutUsVC()
            push(vc: vc)
        case .none:
            break
        }
    }

    private func push(vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
}
