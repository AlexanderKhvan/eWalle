//
//  DataStores.swift
//  eWalle
//
//  Created by Alexander Khvan on 19.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

class DataStores {
    var globalDataStore: GlobalDataStore = GlobalDataStore()
    
    var entranceDataStore: EntranceDataStore = EntranceDataStore()
    var mainDataStore: MainDataStore = MainDataStore()
}
