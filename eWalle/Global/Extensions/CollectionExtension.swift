//
//  CollectionExtension.swift
//  eWalle
//
//  Created by Alexander Khvan on 16.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

extension UICollectionView {
    func registerCells(_ cellIdentifiers:[String]) {
        for identifier in cellIdentifiers {
            self.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
        }
    }
    
    func registerHeaders(_ cellIdentifiers:[String]) {
        for identifier in cellIdentifiers {
            self.register(UINib(nibName: identifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifier)
        }
    }
}
