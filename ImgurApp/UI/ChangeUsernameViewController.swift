//
//  ChangeUsernameViewController.swift
//  ImgurApp
//
//  Created by Jake Elrod on 7/22/19.
//  Copyright © 2019 Stephen Elrod. All rights reserved.
//

import Foundation
import UIKit

protocol ChangeUsernameViewControllerDelegate {
    func usernameChanged(username: String?)
}

class ChangeUsernameViewController: UIViewController {
    
    var delegate: ChangeUsernameViewControllerDelegate? = nil
    
    @IBOutlet var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.usernameTextField.becomeFirstResponder()
    }
    
    @IBAction func viewAlbumsTapped(_ sender: Any) {
        self.delegate?.usernameChanged(username: self.usernameTextField.text)
        self.dismiss(animated: true)
    }
    
    @IBAction func viewTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
