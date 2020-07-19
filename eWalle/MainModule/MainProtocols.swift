//
//  MainProtocols.swift
//  eWalle
//
//  Created by Alexander Khvan on 14.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

protocol MainViewProtocol: class {
    func displayBalance(viewModel: MainDataFlow.UserBalance.ViewModel)
    func displayContacts(viewModel: MainDataFlow.Contacts.ViewModel)
}

protocol MainPresenterProtocol: class {
    init(view: MainViewProtocol, dataProvider: MainDataProviderInput)
    
    func getBalanceRequest()
    func getContactsRequest()
}

protocol MainDataProviderInput {
    func getUserBalance() -> Double?
    func getContacts() -> [SendMoneyToPerson]?
}
