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
  
    let ToTabBarController = "ToTabBarController"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let recognizer = UITapGestureRecognizer (target: self, action: #selector(onTap))
        view.addGestureRecognizer(recognizer)
       
    }
    
    @objc func onTap () {
        print("tap")
        self.view.endEditing(true)
    }
        
    @IBAction func loginButPress(_ sender: UIButton) {

        if let login = userNameField.text, login == "user", let password = loginField.text, password == "1111" {
        userNameField.backgroundColor = UIColor.green
        loginField.backgroundColor = UIColor.green
        performSegue(withIdentifier: ToTabBarController, sender: nil)
    } else {
        let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
    
    
    
    

}
