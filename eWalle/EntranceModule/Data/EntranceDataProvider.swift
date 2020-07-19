//
//  EntranceDataProvider.swift
//  eWalle
//
//  Created by Alexander Khvan on 19.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

class EntranceDataProvider {
    
    private let dataStore: EntranceDataStore
    
    required init(dataStore: EntranceDataStore) {
        self.dataStore = dataStore
    }
    
}

extension EntranceDataProvider: EntranceDataProviderInput {
    func getWeatherTemperature() -> Weather? {
        return dataStore.weatherTemperature
    }
}
