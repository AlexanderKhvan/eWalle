//
//  DefaultViewController.swift
//  eWalle
//
//  Created by Alexander Khvan on 19.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class DefaultViewController: UIViewController {
    
    var delegate: SubMenuViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapCallMenuButton(_ sender: Any) {
        delegate?.callMenu(fromVC: self)
    }

}
