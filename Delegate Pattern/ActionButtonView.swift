//
//  ActionButtonView.swift
//  Delegate Pattern
//
//  Created by Anh Dinh on 5/11/24.
//

import UIKit

protocol ActionButtonViewDelegate: AnyObject {
    func onPrimaryTap()
    func onSecondaryTap()
}

class ActionButtonView: UIView {

    private var primaryActionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Primary Action", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    
    private var secondaryActionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Secondary Action", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    weak var delegate: ActionButtonViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
        
        self.addSubview(primaryActionButton)
        self.addSubview(secondaryActionButton)
        NSLayoutConstraint.activate([
            primaryActionButton.widthAnchor.constraint(equalToConstant: 200),
            primaryActionButton.heightAnchor.constraint(equalToConstant: 44),
            primaryActionButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            primaryActionButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            secondaryActionButton.topAnchor.constraint(equalTo: primaryActionButton.bottomAnchor, constant: 16),
            secondaryActionButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        primaryActionButton.addTarget(self, action: #selector(handlePrimaryTap), for: .touchUpInside)
        secondaryActionButton.addTarget(self, action: #selector(handleSecondaryTap), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handlePrimaryTap() {
        self.delegate?.onPrimaryTap()
    }
    
    @objc func handleSecondaryTap() {
        self.delegate?.onSecondaryTap()
    }
    
}
