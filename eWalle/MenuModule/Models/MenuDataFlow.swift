//
//  MenuDataFlow.swift
//  eWalle
//
//  Created by Alexander Khvan on 19.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

enum MenuDataFlow {
    
    enum ProfileData {
        struct ViewModel {
            var state: MenuDataFlow.ProfileData.ViewState
        }
        
        enum ViewState {
            case success(ProfileModel)
            case error(String)
        }
    }
    
}
