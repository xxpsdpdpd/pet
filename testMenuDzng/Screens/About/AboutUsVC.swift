//
//  AboutUsVC.swift
//  testMenuDzng
//
//  Created by michail on 16.05.2023.
//

import UIKit

protocol PAboutUsVC: AnyObject {
    
}

final class AboutUsVC: BaseVC, PAboutUsVC {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let navigationTitle = "About us"
    
    var viewModel: PAboutUsVM?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        navigationViewTitle = navigationTitle
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCell(ofType: ActionTableCell.self)
    }
}

extension AboutUsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AboutUsDataEnum.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        configureCell(tableView: tableView, indexPath: indexPath)
    }
}

extension AboutUsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = BaseTermsVC(termsType: TermsType(rawValue: indexPath.row)!)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension AboutUsVC: ConfigTableViewCell {
    func configureCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let model = AboutUsDataEnum(rawValue: indexPath.row)?.model else {
            return UITableViewCell()
        }
        
        if let actionCell = tableView.dequeueCell(ofType: ActionTableCell.self) {
            actionCell.setupCell(model: model)
            return actionCell
        }

        return UITableViewCell()
    }
}
