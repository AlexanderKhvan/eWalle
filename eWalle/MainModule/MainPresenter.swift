//
//  MainPresenter.swift
//  eWalle
//
//  Created by Alexander Khvan on 14.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

class MainPresenter {
    
    private let dataProvider: MainDataProviderInput
    let view: MainViewProtocol
    
    required init(view: MainViewProtocol, dataProvider: MainDataProviderInput) {
        self.dataProvider = dataProvider
        self.view = view
    }
    
}

extension MainPresenter: MainPresenterProtocol {
    func getBalanceRequest() {
        let state: MainDataFlow.UserBalance.ViewState
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        if let balance = dataProvider.getUserBalance(), let formatted = numberFormatter.string(from: NSNumber(value: balance)) {
            state = .success(formatted)
        } else {
            state = .error("Ошибка загрузки данных")
        }
        let viewModel = MainDataFlow.UserBalance.ViewModel(state: state)
        view.displayBalance(viewModel: viewModel)
    }
    
    func getContactsRequest() {
        let state: MainDataFlow.Contacts.ViewState
        if let contacts = dataProvider.getContacts() {
            state = .success(contacts)
        } else { state = .error("Ошибка загрузки данных") }
        let viewModel = MainDataFlow.Contacts.ViewModel(state: state)
        view.displayContacts(viewModel: viewModel)
    }
    
}
