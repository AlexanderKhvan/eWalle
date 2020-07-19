//
//  LoadingViewController.swift
//  eWalle
//
//  Created by Alexander Khvan on 12.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class EntranceViewController: UIViewController {
    
    @IBOutlet weak var infoView: UIView!
        @IBOutlet weak var timeLabel: UILabel!
        @IBOutlet weak var dateLabel: UILabel!
    
        @IBOutlet weak var iconWeather: UIImageView!
        @IBOutlet weak var weatherTemperatureLabel: UILabel!
    
    @IBOutlet weak var mainLogoView: UIView!
    
    @IBOutlet weak var signInView: UIView!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var presenter: EntrancePresenterProtocol!
    
    var timer: Timer?

    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        presenter.getWeatherTemperatureRequest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createTimer()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        cancelTimer()
    }
    
    // MARK: - Setups
    func setupSubviews() {
        signInView.layer.cornerRadius = 10
    }
    
    // MARK: - Actions
    @IBAction func tapSignInButton(_ sender: Any) {
        routeToMenu()
    }
    
    @IBAction func tapSignUpButton(_ sender: Any) {
        routeToMenu()
    }
    
}

private extension EntranceViewController {
    // MARK: - Timer
    @objc func updateTimer() {
        let now = Date()
        presenter.updateDateTimeRequest(date: now)
    }
    
    func createTimer() {
        if timer != nil { return }
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        updateTimer()
    }
    
    func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    // MARK: - Routing
    func routeToMenu() {
        let menu = ModuleBuilder.createMenuModule()
        navigationController?.pushViewController(menu, animated: true)
    }
    
    // MARK: - Other private functions
    func entranceAppearAnimation() {
        let views: [UIView] = [infoView, mainLogoView, signInView, createAccountButton]
        views.forEach { $0.alpha = 0 }
        UIView.animate(withDuration: 0.7) { views.forEach { $0.alpha = 1 } }
    }
    
    func customizeWeather(_ model: Weather) {
        weatherTemperatureLabel.text = model.temperature
        if let unwrapp = model.iconWeather, let image = UIImage(named: unwrapp) {
            iconWeather.image = image
        }
    }

}

// MARK: - LoadingViewProtocol
extension EntranceViewController: EntranceViewProtocol {
    func displayWeatherTemperature(viewModel: EntranceDataFlow.WeatherTemperature.ViewModel) {
        switch viewModel.state {
        case let .success(model):
            customizeWeather(model)
        case .error:
            weatherTemperatureLabel.isHidden = true
            iconWeather.isHidden = true
        }
        entranceAppearAnimation()
    }
    
    func displayUpdateDateTime(time: String?, date: String?) {
        timeLabel.text = time
        dateLabel.text = date
    }
}
