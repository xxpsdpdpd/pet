//
//  LimitsProgressView.swift
//  testMenuDzng
//
//  Created by michail on 16.05.2023.
//

import UIKit

protocol PLimitsProgressView {
    func callAnimation(drivingStyleRating: Int, duration: TimeInterval)
    func setupLimitsData(limits: String)
}

final class LimitsView: UIView {
    private var progressLayer: CAShapeLayer?
    private var backgroundLayer: CAShapeLayer?
    private var limitsLabel: UILabel?
    private var perMonth: UILabel?
    
    private let padding: CGFloat = 30
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configurelayers()
        self.configureLabel()
    }
    
    private func configureLabel() {
        limitsLabel = UILabel()
        limitsLabel?.textColor = ProgressViewLabelType.limit.textColor
        limitsLabel?.font = ProgressViewLabelType.limit.font

        perMonth = UILabel()
        perMonth?.textColor = ProgressViewLabelType.perMonth.textColor
        perMonth?.text = ProgressViewLabelType.perMonth.text
        perMonth?.font = ProgressViewLabelType.perMonth.font
        
        if let limitsLabel = limitsLabel, let perMonth = perMonth {
            self.addSubview(limitsLabel)
            self.addSubview(perMonth)
            configureLabelConstraints()
        }
    }
    
    private func configureLabelConstraints() {
        limitsLabel?.translatesAutoresizingMaskIntoConstraints = false
        perMonth?.translatesAutoresizingMaskIntoConstraints = false
        
        limitsLabel?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        limitsLabel?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        perMonth?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        perMonth?.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: padding).isActive = true
    }
    
    private func configurelayers() {
        let backgroundLayer = createLayers(type: .background)
        let progressLayer = createLayers(type: .progress)
        
        self.progressLayer = progressLayer
        self.backgroundLayer = backgroundLayer
        
        self.layer.addSublayer(backgroundLayer)
        self.layer.addSublayer(progressLayer)
    }
    
    private var progressBarPath: CGPath {
        UIBezierPath(
            arcCenter: CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2),
            radius: self.bounds.width / 2,
            startAngle: CGFloat.pi,
            endAngle: CGFloat.pi * 3,
            clockwise: true
        ).cgPath
    }
    
    private func createLayers(type: ProgressViewType) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.path = progressBarPath
        layer.strokeColor = type.color
        layer.fillColor = nil
        layer.lineCap = .round
        layer.lineWidth = 15
        
        if type == .progress {
            layer.strokeEnd = 0
        }
        
        return layer
    }
    
    private func removeAnimations() {
        progressLayer?.removeAllAnimations()
        progressLayer?.strokeEnd = 0
        backgroundLayer?.removeAllAnimations()
    }
}

extension LimitsView: PLimitsProgressView {
    func setupLimitsData(limits: String) {
        limitsLabel?.text = limits
    }
    
    func callAnimation(drivingStyleRating: Int, duration: TimeInterval) {
        removeAnimations()
        
        let progress = CGFloat(drivingStyleRating) / 100
        
        progressLayer?.strokeEnd = progress
        
        let strokeEnaAnimation = CABasicAnimation(keyPath: ProgressAnimationKeys.strokeEnd.rawValue)
        
        strokeEnaAnimation.fromValue = 0
        strokeEnaAnimation.toValue = progress
        strokeEnaAnimation.duration = duration
        
        progressLayer?.add(strokeEnaAnimation, forKey: ProgressAnimationKeys.strokeEndAnimation.rawValue)
    }
}
