//
//  MainCollectionDataSource.swift
//  eWalle
//
//  Created by Alexander Khvan on 14.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

protocol MainCollectionDataSourceProtocol {
    func allowedDelegates(collectionView: UICollectionView, vc: MainViewController)
    func setUserBalance(_ balance: String)
    func setContacts(_ model: [SendMoneyToPerson])
}

protocol MainCollectionDataSourceDelegate: class {
}

class MainCollectionDataSource: NSObject {
    weak var collectionView: UICollectionView?
    weak var delegate: MainCollectionDataSourceDelegate?
    
    var viewModel: [MainSectionViewModel] = [
        MainSectionViewModel(icon: nil, section: .accountOverview,  cells: [.balance]),
        MainSectionViewModel(icon: "icSendMoneySection", section: .sendMoney, cells: [.sendMoney]),
        MainSectionViewModel(icon: "icServices", section: .services, cells: [
            .service(ServiceViewModel(icon: "icSendMoney", cell: .sendMoney)),
            .service(ServiceViewModel(icon: "icReceiveMoney", cell: .receiveMoney)),
            .service(ServiceViewModel(icon: "icMobilePrepaid", cell: .mobilePrepaid)),
            .service(ServiceViewModel(icon: "icElectricityBill", cell: .electricityBill)),
            .service(ServiceViewModel(icon: "icCashbackOffer", cell: .cashbackOffer)),
            .service(ServiceViewModel(icon: "icMovieTickets", cell: .movieTicket)),
            .service(ServiceViewModel(icon: "icFlightTickets", cell: .flightTicket)),
            .service(ServiceViewModel(icon: "icMoreOptions", cell: .moreOptions))
        ])
    ]
    
    var balanceCell: MainBalanceCollectionCell?
    var contactsCell: SendMoneyCollectionCell?
    
}

extension MainCollectionDataSource: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel[section].cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MainHeaderCollectionView", for: indexPath) as! MainHeaderCollectionView
        let model = viewModel[indexPath.section]
        header.customize(title: model.section.rawValue, iconName: model.icon)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch viewModel[indexPath.section].cells[indexPath.item] {
        case .balance:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainBalanceCollectionCell", for: indexPath as IndexPath) as! MainBalanceCollectionCell
            balanceCell = cell
            return cell
        case .sendMoney:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SendMoneyCollectionCell", for: indexPath as IndexPath) as! SendMoneyCollectionCell
            contactsCell = cell
            return cell
        case let .service(item):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCollectionCell", for: indexPath as IndexPath) as! ServiceCollectionCell
            cell.customize(item)
            return cell
        }
    }
}

extension MainCollectionDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        switch viewModel[indexPath.section].cells[indexPath.item] {
        case .balance:
            return CGSize(width: width - 50, height: 116)
        case .sendMoney:
            return CGSize(width: width, height: 120)
        case .service:
            return CGSize(width: 60, height: 96)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch viewModel[section].section {
        case .accountOverview, .services:
            return UIEdgeInsets(top: 20, left: 20, bottom: 40, right: 20)
        case .sendMoney:
            return UIEdgeInsets(top: 20, left: 0, bottom: 40, right: 0)
        }
    }
}

extension MainCollectionDataSource: MainCollectionDataSourceProtocol {
    func allowedDelegates(collectionView: UICollectionView, vc: MainViewController) {
        self.collectionView = collectionView
        self.delegate = vc
    }
    
    func setUserBalance(_ balance: String) {
        balanceCell?.balanceLabel.text = balance
    }
    
    func setContacts(_ model: [SendMoneyToPerson]) {
        let cells: [PersonToSendMoneyCell] = model.map { .person($0) }
        contactsCell?.setViewModel(cells)
    }
}
