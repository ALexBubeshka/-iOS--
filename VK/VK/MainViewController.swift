//
//  MainViewController.swift
//  VK
//
//  Created by Alexander Bubeshka on 22.05.22.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var buttonEnter: UIButton!
    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var ViewTapTap: UIView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let recognizer = UITapGestureRecognizer (target: self, action: #selector(onTap))
        view.addGestureRecognizer(recognizer)
       
    }
    
    @objc func onTap () {
        print("tap")
        self.view.endEditing(true)
        
    }
 
    @IBAction func loginButtonPress(_ sender: Any) {
        
        if let login = userNameField.text, login == "admin"{
            userNameField.backgroundColor = UIColor.green
        }
        else {
            userNameField.backgroundColor = UIColor.red
        }
    }
  
    @IBAction func passwordButtonPress(_ sender: Any) {
        if let password = loginField.text, password == "1111" {
            loginField.backgroundColor = UIColor.green
        }
        else {
            loginField.backgroundColor = UIColor.red
        }
    }
    }
