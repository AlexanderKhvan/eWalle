//
//  ModuleBuilder.swift
//  eWalle
//
//  Created by Alexander Khvan on 12.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

protocol Builder {
    static func createEntranceModule() -> UIViewController
    static func createMenuModule() -> UIViewController
    static func createMainModule() -> MainViewController
}

class ModuleBuilder: Builder {
    static func createEntranceModule() -> UIViewController {
        let dataStores = Assembler.dataStores
        let dataProvider = EntranceDataProvider(dataStore: dataStores.entranceDataStore)
        let view = EntranceViewController()
        let presenter = EntrancePresenter(view: view, dataProvider: dataProvider)
        view.presenter = presenter
        return view
    }
    
    static func createMainModule() -> MainViewController {
        let dataStores = Assembler.dataStores
        let dataProvider = MainDataProvider(globalDataStore: dataStores.globalDataStore, dataStore: dataStores.mainDataStore)
        let view = MainViewController()
        let presenter = MainPresenter(view: view, dataProvider: dataProvider)
        view.presenter = presenter
        return view
    }
    
    static func createMenuModule() -> UIViewController {
        let dataStores = Assembler.dataStores
        let dataProvider = MenuDataProvider(globalDataStore: dataStores.globalDataStore)
        let view = MenuViewController()
        let presenter = MenuPresenter(view: view, dataProvider: dataProvider)
        view.presenter = presenter
        return view
    }
}
