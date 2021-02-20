//
//  RocketTableViewCell.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import UIKit

class RocketTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var rocketImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var successRateLabel: UILabel!
    
    func setup(with viewModel: RocketCellViewModel) {
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        successRateLabel.text = viewModel.successRate
        rocketImageView.setImage(from: viewModel.imageUrl)
    }
    
}
