//
//  RemoveViewController.swift
//  happnPairProg
//
//  Created by Radosław Halski on 03/06/2022.
//

import UIKit

class RemoveViewController: UIViewController {
		
	private lazy var textField: UITextField = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.placeholder = "User name to be removed"
		return $0
	}(UITextField())
	
	private lazy var removeButton: UIButton = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.setTitle("Remove User", for: .normal)
		return $0
	}(UIButton(type: .system))
		
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}
	
	private func setupUI() {
		view.backgroundColor = .white
		view.addSubview(textField)
		view.addSubview(removeButton)
		
		NSLayoutConstraint.activate([
			textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 36),
			textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
			
			removeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			removeButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 24)
		])
		
		removeButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
	}
	
	@objc
	func buttonAction() {
		
	}
}
