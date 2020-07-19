//
//  SendMoneyCollectionCell.swift
//  eWalle
//
//  Created by Alexander Khvan on 18.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class SendMoneyCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cells: [PersonToSendMoneyCell] = [.addPerson]

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.registerCells(["PersonToSendMoneyCollectionCell", "AddPersonToSendMoneyCollectionCell"])
        collectionView.alwaysBounceHorizontal = true
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setViewModel(_ cells: [PersonToSendMoneyCell]) {
        self.cells = [.addPerson] + cells
        collectionView.reloadData()
    }

}

extension SendMoneyCollectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch cells[indexPath.item] {
        case .addPerson:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddPersonToSendMoneyCollectionCell", for: indexPath) as! AddPersonToSendMoneyCollectionCell
            return cell
        case let .person(item):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonToSendMoneyCollectionCell", for: indexPath) as! PersonToSendMoneyCollectionCell
            cell.customize(item)
            return cell
        }
    }
}

extension SendMoneyCollectionCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch cells[indexPath.item] {
        case .addPerson:
            return CGSize(width: 52, height: 52)
        case .person:
            return CGSize(width: 100, height: 120)
        }
    }
}
