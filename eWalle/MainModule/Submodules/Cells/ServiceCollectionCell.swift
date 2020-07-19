//
//  ServiceCollectionCell.swift
//  eWalle
//
//  Created by Alexander Khvan on 18.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class ServiceCollectionCell: UICollectionViewCell {

    @IBOutlet weak var iconView: UIView!
        @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var action: ServiceCell?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupSubviews()
    }

    func setupSubviews() {
        iconView.layer.cornerRadius = 12
    }
    
    func customize(_ model: ServiceViewModel) {
        action = model.cell
        nameLabel.text = model.cell.rawValue
        if let unwrapp = model.icon, let image = UIImage(named: unwrapp) {
            iconImage.image = image
        }
    }

}
