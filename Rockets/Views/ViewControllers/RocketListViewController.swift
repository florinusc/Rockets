//
//  RocketListViewController.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import UIKit

class RocketListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let viewModel = RocketListViewModel(repository: MockRepository())

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        title = "Rockets"
        setupTableView()
        getData()
    }
    
    private func setupTableView() {
        tableView.register(RocketTableViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.tableFooterView = UIView()
    }
    
    private func getData() {
        viewModel.getData({ [weak self] (error) in
            if let error = error {
                self?.presentAlert(for: error)
                return
            }
            self?.tableView.reloadData()
        })
    }
    
}

extension RocketListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRockets
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RocketTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        if let cellViewModel = viewModel.rocketCellViewModel(at: indexPath.row) {
            cell.setup(with: cellViewModel)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}