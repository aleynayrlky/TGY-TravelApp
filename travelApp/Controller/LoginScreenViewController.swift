//
//  LoginScreenViewController.swift
//  travelApp
//
//  Created by Aleyna Yerlikaya on 20.04.2024.
//

import UIKit

class LoginScreenViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginAction(_ sender: Any) {
        
        
    }
    
    func alertFunc(_ title: String, _ message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    
}
