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
        
//  другой вариант который тоже не работает)
//    func frr () {
//        UIView.animate(withDuration: 3,
//                       animations: { [weak self] in
//
//            let animate1 = CABasicAnimation.init(keyPath: "position.x")
//            animate1.toValue = -700
//            animate1.duration = 3
//            animate1.beginTime = CACurrentMediaTime() + 1
//            self?.loginField.layer.add(animate1, forKey: nil)
//            self?.passwordLabel.layer.add(animate1, forKey: nil)
//
//            let animate2 = CABasicAnimation.init(keyPath: "position.x")
//            animate2.toValue = 700
//            animate2.duration = 2
//            animate2.beginTime = CACurrentMediaTime()
//           self?.userNameField.layer.add(animate2, forKey: nil)
//            self?.nameLabel.layer.add(animate2, forKey: nil)
//
//
//            let animate3 = CABasicAnimation.init(keyPath: "position.y")
//            animate3.toValue = -700
//            animate3.duration = 2
//            animate3.beginTime = CACurrentMediaTime()
//            self?.vkImage.layer.add(animate3, forKey: nil)
//            self?.vkLabel.layer.add(animate3, forKey: nil)
//
//            let animate4 = CABasicAnimation.init(keyPath: "position.y")
//            animate4.toValue = 700
//            animate4.duration = 2
//            animate4.beginTime = CACurrentMediaTime()
//            self?.buttonEnter.layer.add(animate4, forKey: nil)
//
//        },completion: { [weak self] _ in self?.performSegue(withIdentifier: self!.ToTabBarController, sender: nil) })
//    }

    @IBAction func loginButPress(_ sender: UIButton) {
        

        if let login = userNameField.text, login == "user", let password = loginField.text, password == "1111" {
            
            let animate1 = CABasicAnimation.init(keyPath: "position.x")
            animate1.toValue = -700
            animate1.duration = 3
            animate1.beginTime = CACurrentMediaTime() + 1
            loginField.layer.add(animate1, forKey: nil)
            passwordLabel.layer.add(animate1, forKey: nil)

            let animate2 = CABasicAnimation.init(keyPath: "position.x")
            animate2.toValue = 700
            animate2.duration = 2
            animate2.beginTime = CACurrentMediaTime()
           userNameField.layer.add(animate2, forKey: nil)
            nameLabel.layer.add(animate2, forKey: nil)


            let animate3 = CABasicAnimation.init(keyPath: "position.y")
            animate3.toValue = -700
            animate3.duration = 2
            animate3.beginTime = CACurrentMediaTime()
            vkImage.layer.add(animate3, forKey: nil)
            vkLabel.layer.add(animate3, forKey: nil)

            let animate4 = CABasicAnimation.init(keyPath: "position.y")
            animate4.toValue = 700
            animate4.duration = 2
            animate4.beginTime = CACurrentMediaTime()
            buttonEnter.layer.add(animate4, forKey: nil)

      performSegue(withIdentifier: ToTabBarController, sender: nil)

    } else {
        let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
    
}


