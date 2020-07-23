//
//  DataStores.swift
//  eWalle
//
//  Created by Alexander Khvan on 19.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

class DataStores {
    lazy var globalDataStore: GlobalDataStore = GlobalDataStore()
    
    lazy var entranceDataStore: EntranceDataStore = EntranceDataStore()
    lazy var mainDataStore: MainDataStore = MainDataStore()
}
