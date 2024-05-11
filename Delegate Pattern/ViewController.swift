//
//  ViewController.swift
//  Delegate Pattern
//
//  Created by Anh Dinh on 5/11/24.
//

import UIKit

class ViewController: UIViewController {

    private var actionButtonView = ActionButtonView()
    private var textLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        
        // Set delegate
        actionButtonView.delegate = self
        
        // add actionButtonView
        view.addSubview(actionButtonView)
        actionButtonView.translatesAutoresizingMaskIntoConstraints = false
        actionButtonView.layer.shadowColor = UIColor.black.cgColor
        NSLayoutConstraint.activate([
            actionButtonView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            actionButtonView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            actionButtonView.widthAnchor.constraint(equalToConstant: 300),
            actionButtonView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        // add label
        view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textLabel.topAnchor.constraint(equalTo: actionButtonView.bottomAnchor, constant: 16)
        ])
        textLabel.text = "Text Label !!!"
        textLabel.isHidden = true
    }
}

extension ViewController: ActionButtonViewDelegate {
    func onPrimaryTap() {
        DispatchQueue.main.async {
            self.textLabel.isHidden = false
            self.textLabel.text = "Primary tapped"
        }
    }
    
    func onSecondaryTap() {
        DispatchQueue.main.async {
            self.textLabel.isHidden = false
            self.textLabel.text = "Secondary tapped"
        }
    }
}
