//
//  MainViewController.swift
//  eWalle
//
//  Created by Alexander Khvan on 14.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var mainCollection: UICollectionView!
    
    var presenter: MainPresenterProtocol!
    
    var delegate: SubMenuViewControllerDelegate?
    
    let mainCollectionDataSource = MainCollectionDataSource()

    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainCollection()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.getBalanceRequest()
    }
    
    // MARK: - Setups
    func setupMainCollection() {
        mainCollection.registerCells(["MainBalanceCollectionCell", "SendMoneyCollectionCell", "ServiceCollectionCell"])
        mainCollection.registerHeaders(["MainHeaderCollectionView", "FetchingMoreCollectionView"])
        mainCollection.alwaysBounceVertical = true
        mainCollectionDataSource.allowedDelegates(collectionView: mainCollection, vc: self)
        mainCollection.dataSource = mainCollectionDataSource
        mainCollection.delegate = mainCollectionDataSource
    }

    // MARK: - Actions
    @IBAction func tapCallMenuButton(_ sender: Any) {
        delegate?.callMenu(fromVC: self)
    }
    
}

private extension MainViewController {
    // MARK: - Routing
    func showMessageAlert(title: String, text: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .cancel, handler: handler))
        present(alert, animated: false, completion: nil)
    }
}

// MARK: - MainViewProtocol
extension MainViewController: MainViewProtocol {
    func displayBalance(viewModel: MainDataFlow.UserBalance.ViewModel) {
        switch viewModel.state {
        case let .success(model):
            mainCollectionDataSource.setUserBalance(model)
            presenter.getContactsRequest()
        case let .error(message):
            showMessageAlert(title: "Баланс", text: message)
        }
    }
    
    func displayContacts(viewModel: MainDataFlow.Contacts.ViewModel) {
        switch viewModel.state {
        case let .success(model):
            mainCollectionDataSource.setContacts(model)
        case let .error(message):
            showMessageAlert(title: "Контакты", text: message)
        }
    }
}

// MARK: - MainCollectionDataSourceDelegate
extension MainViewController: MainCollectionDataSourceDelegate {
    
}
