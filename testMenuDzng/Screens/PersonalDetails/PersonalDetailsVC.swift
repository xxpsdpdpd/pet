//
//  PersonalDetailsVC.swift
//  testMenuDzng
//
//  Created by michail on 15.05.2023.
//

import UIKit

protocol PPersonalDetailsVC: AnyObject {
    
}

final class PersonalDetailsVC: BaseVC, PPersonalDetailsVC {
    @IBOutlet private weak var tableView: UITableView!
    
    private let heightForRow: CGFloat = 90
    private let heightForHeader: CGFloat = 180
    
    private let navigationTitle = "Personal details"
    
    var viewModel: PPersonalDetailsVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.setupCellModels()
        configureView()
        navigationViewTitle = navigationTitle
    }
    
    private func configureView() {
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(ofType: PersonalDetailsCell.self)
        tableView.registerHeaderFooterView(ofType: HeaderMenuView.self)
    }
}

extension PersonalDetailsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        heightForRow
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        setupHeaderTableView(tableView: tableView, section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        heightForHeader
    }
}

extension PersonalDetailsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.cellModels.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        configureCell(tableView: tableView, indexPath: indexPath)
    }
}

//MARK: - Configure Cell and Header
extension PersonalDetailsVC: ConfigTableViewHeader {
    func setupHeaderTableView(tableView: UITableView, section: Int) -> UIView? {
        let header = tableView.dequeueHeaderFooterView(ofType: HeaderMenuView.self)
        let model = HeaderMenuModel(name: "qeweqwe", image: AppAssets.personalDetails.image)
        header?.configureView(model: model)
        return header
    }
}

extension PersonalDetailsVC: ConfigTableViewCell {
    func configureCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(ofType: PersonalDetailsCell.self) else {
            return UITableViewCell()
        }
        
        guard let cellData = viewModel?.cellModels[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.configureCell(model: cellData.model)
        
        return cell
    }
}
