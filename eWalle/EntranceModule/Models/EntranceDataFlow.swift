//
//  EntranceDataFlow.swift
//  eWalle
//
//  Created by Alexander Khvan on 19.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

enum EntranceDataFlow {
    
    enum WeatherTemperature {
        struct ViewModel {
            var state: EntranceDataFlow.WeatherTemperature.ViewState
        }
        
        enum ViewState {
            case success(Weather)
            case error
        }
    }
    
}
