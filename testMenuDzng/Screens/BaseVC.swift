//
//  BaseVC.swift
//  testMenuDzng
//
//  Created by michail on 18.05.2023.
//

import Foundation
import UIKit

class BaseVC: UIViewController, NavigationBarActions {
    
    @IBOutlet private var topConstraint: NSLayoutConstraint?
    
    private let navBarView = NavigationBarView()
    
    var isNavigationBarHidden: Bool {
        false
    }
    
    var navigationViewTitle: String = "" {
        didSet {
            navBarView.setupTitle(text: navigationViewTitle)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        if isNavigationBarHidden {
            return
        }
        
        navBarView.delegate = self
        topConstraint?.constant = navBarView.height
        view.addSubview(navBarView)
        
        navBarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            navBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navBarView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            navBarView.heightAnchor.constraint(equalToConstant: navBarView.height),
            navBarView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    func configureView(image: UIImage) {
        navBarView.setActionButtonImage(image: image)
    }
    
    func dissmis() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func rightButtonAction() {
        guard let url = URL(string: "http://t.me/share/text=test") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
