//
//  LimitsVC.swift
//  testMenuDzng
//
//  Created by michail on 16.05.2023.
//

import UIKit

protocol PLimitsVC: AnyObject {
    
}

final class LimitsVC: BaseVC, PLimitsVC {
    
    @IBOutlet private weak var progressContainer: LimitsView!
    
    private let navigationTitle = "Limits"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        self.navigationViewTitle = navigationTitle
        self.progressContainer.setupLimitsData(limits: "$10 000.00")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.progressContainer.callAnimation(drivingStyleRating: 100, duration: TimeInterval(integerLiteral: 1))
        }
    }
}
