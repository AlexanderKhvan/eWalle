//
//  ViewControllerExtension.swift
//  eWalle
//
//  Created by Alexander Khvan on 19.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

//MARK: Add/Remove Child ViewControllers Extension -
extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
