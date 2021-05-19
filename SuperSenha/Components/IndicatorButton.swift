//
//  IndicatorButton.swift
//  SuperSenha
//
//  Created by Diogenes de Souza on 19/05/21.
//

import Foundation
import UIKit

class IndicatorButton: UIButton {
    var originalButtonText: String?
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: .zero)
    
    
    init() {
        super.init(frame: .zero)
        self.activityIndicator.color = .white
    }
    
    required init?(coder: NSCoder) {
super.init(coder: coder)
        self.activityIndicator.color = .white
    }
    
    func showLoading() {
        originalButtonText = self.titleLabel?.text
        self.setTitle("", for: .normal)
        showSpinning()
    }
    
    func hideLoading() {
        self.setTitle(originalButtonText, for: .normal)
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor.white
        return activityIndicator
    }
    
    private func showSpinning() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activityIndicator)
        centerActivityIndicatorInButton()
        activityIndicator.startAnimating()
    }
    
    private func centerActivityIndicatorInButton() {
        let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
        self.addConstraint(xCenterConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraint(yCenterConstraint)
    }
}
