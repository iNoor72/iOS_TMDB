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
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 16.0
    }
    
    @IBAction func loginBtnPressed(_ sender: UIButton){
        guard let email = emailTF.text else {
            return
        }
        guard let password = passwordTF.text else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if error != nil {
                //Change the rootVC to be the HomeVC, but HomeVC is not VC it's a TabbarVC
                
                //self?.view.window?.rootViewController =
                
                //Pass the user's info
                //prepare() for segue
            }
            
        }
        
    }
    
}
