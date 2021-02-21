//
//  RegisterVC.swift
//  TMDB
//
//  Created by Noor Walid on 21/01/2021.
//

import UIKit
import FirebaseAuth
import RealmSwift

class RegisterVC: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.layer.cornerRadius = 16.0
    }


    @IBAction func registerBtnPressed(_ sender: UIButton) {
        guard let email = emailTF.text else {
            return
        }
        guard let password = passwordTF.text else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            print(error.debugDescription)
        }
    }
    

}
