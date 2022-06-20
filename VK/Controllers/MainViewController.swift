//
//  MainViewController.swift
//  VK
//
//  Created by Alexander Bubeshka on 22.05.22.
//
import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var vkImage: UIImageView!
    @IBOutlet weak var vkLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var buttonEnter: UIButton!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    
    let ToTabBarController = "ToTabBarController"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

  }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView()
        secondView.alpha = 0
        thirdView.alpha = 0
        
        firstView.layer.cornerRadius = 18
        secondView.layer.cornerRadius = 18
        thirdView.layer.cornerRadius = 18
        
        firstView.layer.shadowColor = UIColor.black.cgColor
        firstView.layer.shadowOffset = CGSize(width: 7, height: 5)
        firstView.layer.shadowRadius = 5
        firstView.layer.shadowOpacity = 0.5
        
        secondView.layer.shadowColor = UIColor.black.cgColor
        secondView.layer.shadowOffset = CGSize(width: 7, height: 5)
        secondView.layer.shadowRadius = 5
        secondView.layer.shadowOpacity = 0.5
        
        thirdView.layer.shadowColor = UIColor.black.cgColor
        thirdView.layer.shadowOffset = CGSize(width: 7, height: 5)
        thirdView.layer.shadowRadius = 5
        thirdView.layer.shadowOpacity = 0.5
        
        let recognizer = UITapGestureRecognizer (target: self, action: #selector(onTap))
        view.addGestureRecognizer(recognizer)
       
    }
    
    func animationView() {
        UIView.animate(withDuration: 0.45) { [weak self] in
            self?.firstView.alpha = 0
            self?.secondView.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 0.45) { [weak self] in
                self?.secondView.alpha = 0
                self?.thirdView.alpha = 1
            } completion: { _ in
                UIView.animate(withDuration: 0.45) { [weak self] in
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
            
                let animate1 = CABasicAnimation.init(keyPath: "position.x")
                animate1.toValue = -700
                animate1.duration = 3
                loginField.layer.add(animate1, forKey: nil)
                passwordLabel.layer.add(animate1, forKey: nil)

                let animate2 = CABasicAnimation.init(keyPath: "position.x")
                animate2.toValue = 700
                animate2.duration = 2
                userNameField.layer.add(animate2, forKey: nil)
                nameLabel.layer.add(animate2, forKey: nil)

                let animate3 = CABasicAnimation.init(keyPath: "position.y")
                animate3.toValue = -700
                animate3.duration = 2
                vkImage.layer.add(animate3, forKey: nil)
                vkLabel.layer.add(animate3, forKey: nil)

            UIView.animate(withDuration: 1.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0) {[weak self] in
                let animate4 = CABasicAnimation.init(keyPath: "position.y")
                animate4.toValue = 700
                animate4.duration = 2
                self?.buttonEnter.frame.origin.y -= 100
                self?.buttonEnter.layer.add(animate4, forKey: nil)
            } completion: {[weak self] _ in
                guard let self = self else {return}
               self.performSegue(withIdentifier: self.ToTabBarController, sender: nil)
            }
    } else {
        let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        }
    }
}


