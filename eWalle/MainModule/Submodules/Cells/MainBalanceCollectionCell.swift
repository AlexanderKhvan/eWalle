//
//  MainBalanceCollectionCell.swift
//  eWalle
//
//  Created by Alexander Khvan on 16.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class MainBalanceCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var cicleView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupSubviews()
    }
    
    func setupSubviews() {
        layer.cornerRadius = 12
        cicleView.layer.cornerRadius = 24
    }

}
