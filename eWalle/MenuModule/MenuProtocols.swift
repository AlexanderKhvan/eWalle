//
//  MenuProtocols.swift
//  eWalle
//
//  Created by Alexander Khvan on 18.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

protocol MenuViewProtocol: class {
    func displayProfileData(viewModel: MenuDataFlow.ProfileData.ViewModel)
    func displayAppVersion(model: String)
}

protocol MenuPresenterProtocol: class {
    init(view: MenuViewProtocol, dataProvider: MenuDataProviderInput)
    
    func getProfileDataRequest()
    func appVersionRequest()
}

protocol SubMenuViewControllerDelegate: class {
    func callMenu(fromVC: UIViewController)
}

protocol MenuDataProviderInput {
    func getProfileData() -> ProfileModel?
}
