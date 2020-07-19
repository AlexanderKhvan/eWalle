//
//  MenuViewController.swift
//  eWalle
//
//  Created by Alexander Khvan on 18.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var profileView: UIView!
        @IBOutlet weak var profileAvatarImage: UIImageView!
        @IBOutlet weak var userNameLabel: UILabel!
        @IBOutlet weak var userLocationLabel: UILabel!
    
    @IBOutlet weak var menuContainerView: UIView!
        @IBOutlet weak var selectIndicator: UIView!
        @IBOutlet weak var menuStackView: UIStackView!
    
    @IBOutlet weak var appVersionLabel: UILabel!
    
    var presenter: MenuPresenterProtocol!
    
    var mainViewController: UIViewController!
    var defaultViewController: UIViewController!
    
    var selectedMenuViewController: UIViewController!
    var selectedMenuButton: UIButton?
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        presenter.appVersionRequest()
        presenter.getProfileDataRequest()
        configureMainViewController()
    }
    
    // MARK: - Setups
    func setupSubviews() {
        profileView.round(corners: [.bottomRight], radius: 53.5)
        
        profileAvatarImage.layer.cornerRadius = 22
        
        for button in menuStackView.arrangedSubviews as! [UIButton] {
            button.addTarget(self, action: #selector(sideBarActions(_:)), for: .touchUpInside)
        }
        
        if let fistMenuItem = menuStackView.arrangedSubviews.first as? UIButton {
            selectAnimation(sender: fistMenuItem)
            selectedMenuButton = fistMenuItem
        }
        
    }
    
    // MARK: - Actions
    @IBAction func tapLogoutButton(_ sender: Any) {
        routeToEntrance()
    }
    
    @IBAction func tapCloseButton(_ sender: Any) {
        toggleViewController(false, vc: selectedMenuViewController)
    }
    
    @objc func sideBarActions(_ sender: UIButton) {
        if selectedMenuButton == sender {
            toggleViewController(false, vc: selectedMenuViewController)
        } else {
            selectAnimation(sender: sender)
            
            selectedMenuViewController.remove()
            selectedMenuViewController.view.layer.cornerRadius = 0
            selectedMenuViewController.view.transform = CGAffineTransform.identity
            switch menuStackView.arrangedSubviews.firstIndex(of: sender) {
            case 0:
                configureMainViewController()
            default:
                configureDefaultViewController()
            }
            selectedMenuViewController.view.layer.cornerRadius = 30
            selectedMenuViewController.view.transform = CGAffineTransform.identity
            .rotated(by: -0.26)
            .scaledBy(x: 0.67, y: 0.67)
            .translatedBy(x: view.frame.width / 1.5, y: profileView.frame.height)
            toggleViewController(false, vc: selectedMenuViewController)
        }
        selectedMenuButton = sender
    }
    
}

private extension MenuViewController {
    // MARK: - Configure ViewControllers
    func configureMainViewController() {
        if mainViewController == nil {
            let viewController = ModuleBuilder.createMainModule()
            viewController.delegate = self
            mainViewController = viewController
        }
        selectedMenuViewController = mainViewController
        add(mainViewController)
        mainViewController.view.frame = view.frame
    }
    
    func configureDefaultViewController() {
        if defaultViewController == nil {
            let viewController = DefaultViewController()
            viewController.delegate = self
            defaultViewController = viewController
        }
        selectedMenuViewController = defaultViewController
        add(defaultViewController)
        defaultViewController.view.frame = view.frame
    }
    
    // MARK: - Routing
    func routeToEntrance() {
        navigationController?.popViewController(animated: true)
    }
    
    func showMessageAlert(title: String, text: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .cancel, handler: handler))
        present(alert, animated: false, completion: nil)
    }
    
    
    // MARK: - Other privte functions
    func selectAnimation(sender: UIButton) {
        sender.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 16)
        selectedMenuButton?.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
        UIView.animate(withDuration: 0.2) {
            self.selectIndicator.center.y = sender.center.y
        }
    }
    
    func toggleViewController(_ isCollapse: Bool, vc: UIViewController, completion: ((Bool) -> Void)? = nil) {
        if isCollapse {
            let scaled: CGFloat = 0.67
            
            vc.view.animateCornerRadius(to: 30, duration: 0.5)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                vc.view.transform = CGAffineTransform.identity
                    .rotated(by: -0.26)
                    .scaledBy(x: scaled, y: scaled)
                    .translatedBy(x: self.view.frame.width / 1.5, y: self.profileView.frame.height)
            }, completion: completion)
        } else {
            vc.view.animateCornerRadius(to: 0, duration: 0.5)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
               vc.view.transform = CGAffineTransform.identity
            }, completion: completion)
        }
    }
    
    func customizeProfileView(_ model: ProfileModel) {
        userNameLabel.text = model.fullName
        userLocationLabel.text = model.location
        if let unwrapp = model.avatar, let image = UIImage(named: unwrapp) {
            profileAvatarImage.image = image
        }
    }
    
}

// MARK: - MenuViewProtocol
extension MenuViewController: MenuViewProtocol {
    func displayProfileData(viewModel: MenuDataFlow.ProfileData.ViewModel) {
        switch viewModel.state {
        case let .success(model):
            customizeProfileView(model)
        case let .error(message):
            showMessageAlert(title: "Профиль", text: message)
            userNameLabel.isHidden = true
            userLocationLabel.isHidden = true
        }
    }
    
    func displayAppVersion(model: String) {
        appVersionLabel.text = model
    }
}

// MARK: - SubMenuViewControllerDelegate
extension MenuViewController: SubMenuViewControllerDelegate {
    func callMenu(fromVC: UIViewController) {
        toggleViewController(true, vc: fromVC)
    }
}
