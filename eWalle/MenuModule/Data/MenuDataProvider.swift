//
//  MenuDataProvider.swift
//  eWalle
//
//  Created by Alexander Khvan on 19.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

class MenuDataProvider {
    
    private let globalDataStore: GlobalDataStore
    
    required init(globalDataStore: GlobalDataStore) {
        self.globalDataStore = globalDataStore
    }
    
}
 
extension MenuDataProvider: MenuDataProviderInput {
    func getProfileData() -> ProfileModel? {
        return globalDataStore.profile
    }
}
