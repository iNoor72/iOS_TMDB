//
//  RegisterVC.swift
//  TMDB
//
//  Created by Noor Walid on 21/01/2021.
//

import UIKit
import FirebaseAuth

class RegisterVC: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
