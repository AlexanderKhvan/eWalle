//
//  PersonToSendMoneyCollectionCell.swift
//  eWalle
//
//  Created by Alexander Khvan on 18.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class PersonToSendMoneyCollectionCell: UICollectionViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupSubviews()
    }
    
    func setupSubviews() {
        layer.cornerRadius = 12
        avatarImage.layer.cornerRadius = 21
        avatarImage.layer.borderWidth = 2
        avatarImage.layer.borderColor = UIColor(red: 0.227, green: 0.259, blue: 0.463, alpha: 0.2).cgColor
    }
    
    func customize(_ model: SendMoneyToPerson) {
        nameLabel.text = model.name
        if let unwrapp = model.avatar, let image = UIImage(named: unwrapp) {
            avatarImage.image = image
        }
    }

}
