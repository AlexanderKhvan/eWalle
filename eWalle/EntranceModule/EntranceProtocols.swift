//
//  LoadingProtocols.swift
//  eWalle
//
//  Created by Alexander Khvan on 12.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

protocol EntranceViewProtocol: class {
    func displayWeatherTemperature(viewModel: EntranceDataFlow.WeatherTemperature.ViewModel)
    func displayUpdateDateTime(time: String?, date: String?)
}

protocol EntrancePresenterProtocol: class {
    init(view: EntranceViewProtocol, dataProvider: EntranceDataProvider)
    
    func getWeatherTemperatureRequest()
    func updateDateTimeRequest(date: Date)
}

protocol EntranceDataProviderInput {
    func getWeatherTemperature() -> Weather? 
}
