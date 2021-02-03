//
//  LoginVC.swift
//  TMDB
//
//  Created by Noor Walid on 21/01/2021.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginBtnPressed(_ sender: UIButton){
        guard let email = emailTF.text else {
            return
        }
        guard let password = passwordTF.text else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            print(error.debugDescription)
        }
        
    }
    
    
}