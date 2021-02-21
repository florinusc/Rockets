//
//  RocketListViewController.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import UIKit
import SwiftUI

final class RocketListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let viewModel = RocketListViewModel(repository: OnlineRepository())

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupNavBar()
        setupTableView()
        getData()
    }
    
    private func setupNavBar() {
        title = "Rockets"
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    private func setupTableView() {
        tableView.register(RocketTableViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.tableFooterView = UIView()
    }
    
    private func getData() {
        let loadingViewController = LoadingViewController()
        add(loadingViewController)
        viewModel.getData({ [weak self] (error) in
            loadingViewController.remove()
            if let error = error {
                self?.presentAlert(for: error)
                return
            }
            self?.tableView.reloadData()
        })
    }
    
    private func navigateToDetailView(from index: Int) {
        guard let rocketDetailViewModel = viewModel.rocketDetailViewModel(at: index) else { return }
        let rocketDetailController = UIHostingController(rootView: RocketDetailView(viewModel: rocketDetailViewModel))
        navigationController?.pushViewController(rocketDetailController, animated: true)
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
        navigateToDetailView(from: indexPath.row)
    }
}
