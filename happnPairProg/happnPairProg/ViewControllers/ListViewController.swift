//
//  ViewController.swift
//  AndrzejSampleApp
//
//  Created by Julien Sechaud on 11/05/2021.
//

import UIKit

class ListViewController: UIViewController {
	
	private let repository = Repository()
	private var users = [User]() {
		didSet {
			tableView.reloadData()
		}
	}

	private lazy var tableView: UITableView = {
		$0.dataSource = self
		$0.delegate = self
		$0.tableFooterView = UIView()
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		$0.refreshControl = UIRefreshControl(frame: .zero, primaryAction: UIAction(handler: { _ in
			self.fetch()
		}))
		return $0
	}(UITableView())
		
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		fetch()
	}
	
	private func fetch() {
		repository.fetch { result in
			switch result {
			case .success(let users):
				self.users = users ?? []
			case .failure(_):
				break
			}
			tableView.refreshControl?.endRefreshing()
		}
	}
	
	private func setupUI() {
		view.addSubview(tableView)
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
			tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
		])
	}

}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		users.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = users[indexPath.row].firstName
		return cell
	}
}

