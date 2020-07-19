//
//  MainDataProvider.swift
//  eWalle
//
//  Created by Alexander Khvan on 19.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

class MainDataProvider {
    
    private let globalDataStore: GlobalDataStore
    private let dataStore: MainDataStore
    
    required init(globalDataStore: GlobalDataStore, dataStore: MainDataStore) {
        self.globalDataStore = globalDataStore
        self.dataStore = dataStore
    }
    
}
 
extension MainDataProvider: MainDataProviderInput {
    func getUserBalance() -> Double? {
        return globalDataStore.profile?.balance
    }
    
    func getContacts() -> [SendMoneyToPerson]? {
        return dataStore.contacts
    }
}
