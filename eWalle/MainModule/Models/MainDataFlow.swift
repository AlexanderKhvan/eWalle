//
//  MainDataFlow.swift
//  eWalle
//
//  Created by Alexander Khvan on 19.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

enum MainDataFlow {
    
    enum UserBalance {
        struct ViewModel {
            var state: MainDataFlow.UserBalance.ViewState
        }
        
        enum ViewState {
            case success(String)
            case error(String)
        }
    }
    
    enum Contacts {
        struct ViewModel {
            var state: MainDataFlow.Contacts.ViewState
        }
        
        enum ViewState {
            case success([SendMoneyToPerson])
            case error(String)
        }
    }
    
}
