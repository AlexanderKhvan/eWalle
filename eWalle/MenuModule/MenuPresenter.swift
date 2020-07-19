//
//  MenuPresenter.swift
//  eWalle
//
//  Created by Alexander Khvan on 18.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

class MenuPresenter {
    
    let view: MenuViewProtocol
    private let dataProvider: MenuDataProviderInput
    
    required init(view: MenuViewProtocol, dataProvider: MenuDataProviderInput) {
        self.dataProvider = dataProvider
        self.view = view
    }
    
}

extension MenuPresenter: MenuPresenterProtocol {
    func getProfileDataRequest() {
        let state: MenuDataFlow.ProfileData.ViewState
        if let profile = dataProvider.getProfileData() {
            state = .success(profile)
        } else { state = .error("Ошибка загрузки данных") }
        let viewModel = MenuDataFlow.ProfileData.ViewModel(state: state)
        view.displayProfileData(viewModel: viewModel)
    }
    
    func appVersionRequest() {
        let versionString: String
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            versionString = "Version \(version)"
        } else { versionString = "" }
        view.displayAppVersion(model: versionString)
    }
}
