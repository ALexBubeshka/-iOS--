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
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    
    
    let ToTabBarController = "ToTabBarController"
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.repeat, .autoreverse]){ [weak self] in
            guard let self = self else {return}
            self.buttonEnter.alpha = 0.6
        } completion: { _ in
    }
}
    

    override func viewDidLoad() {
        super.viewDidLoad()
        animationView()
        secondView.alpha = 0
        thirdView.alpha = 0
        
        firstView.layer.cornerRadius = 18
        secondView.layer.cornerRadius = 18
        thirdView.layer.cornerRadius = 18
        

        let recognizer = UITapGestureRecognizer (target: self, action: #selector(onTap))
        view.addGestureRecognizer(recognizer)
       
    }
    
    
    func animationView() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.firstView.alpha = 0
            self?.secondView.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.secondView.alpha = 0
                self?.thirdView.alpha = 1
            } completion: { _ in
                UIView.animate(withDuration: 0.3) { [weak self] in
                    self?.firstView.alpha = 1
                    self?.thirdView.alpha = 0
                } completion: { [weak self] _ in
                    self?.animationView()
                }
            }
        }

    
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
