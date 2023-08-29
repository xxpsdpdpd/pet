//
//  NavigationBarView.swift
//  testMenuDzng
//
//  Created by michail on 18.05.2023.
//

import UIKit

final class NavigationBarView: UIView, NibLoadable {
    @IBOutlet private weak var actionButton: UIButton!
    @IBOutlet private weak var navigationTitle: UILabel!
    @IBOutlet private weak var dissmisButton: UIButton!
    
    var height: CGFloat {
        return 62.0
    }
    
    weak var delegate: NavigationBarActions?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    private func configureView() {
        setupFromNib()
        configureButtonImages()
    }
    
    private func configureButtonImages() {
        dissmisButton.setImage(AppAssets.chevron.image, for: .normal)
        actionButton.setImage(AppAssets.support.image, for: .normal)
    }
    
    @IBAction private func action() {
        delegate?.rightButtonAction()
    }
    
    @IBAction private func dissmisAction() {
        delegate?.dissmis()
    }
}

extension NavigationBarView: PNavigationBarVew {
    func setActionButtonImage(image: UIImage) {
        actionButton.setImage(image, for: .normal)
    }
    
    func setupTitle(text: String) {
        navigationTitle.text = text
    }
}
