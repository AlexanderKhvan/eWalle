//
//  LoadingViewPresente.swift
//  eWalle
//
//  Created by Alexander Khvan on 12.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

class EntrancePresenter {
    
    let dataProvider: EntranceDataProvider
    let view: EntranceViewProtocol
    
    required init(view: EntranceViewProtocol, dataProvider: EntranceDataProvider) {
        self.dataProvider = dataProvider
        self.view = view
    }
    
}

extension EntrancePresenter: EntrancePresenterProtocol {
    func getWeatherTemperatureRequest() {
        let state: EntranceDataFlow.WeatherTemperature.ViewState
        if let temp = dataProvider.getWeatherTemperature() {
            state = .success(temp)
        } else { state = .error }
        let viewModel = EntranceDataFlow.WeatherTemperature.ViewModel(state: state)
        view.displayWeatherTemperature(viewModel: viewModel)
    }
    
    func updateDateTimeRequest(date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM.dd.yyyy | EEEE"
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        timeFormatter.amSymbol = "AM"
        timeFormatter.pmSymbol = "PM"
        
        
        let dateString = dateFormatter.string(from: date)
        let timeString = timeFormatter.string(from: date)
        
        view.displayUpdateDateTime(time: timeString, date: dateString)
    }
}
