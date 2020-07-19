//
//  MainHeaderCollectionView.swift
//  eWalle
//
//  Created by Alexander Khvan on 14.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class MainHeaderCollectionView: UICollectionReusableView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func customize(title: String?, iconName: String?) {
        titleLabel.text = title
        
        if let unwrapp = iconName, let image = UIImage(named: unwrapp) {
            icon.isHidden = false
            icon.image = image
        } else {
            icon.isHidden = true
        }
    }
    
}
