//
//  SignupScreenViewController.swift
//  travelApp
//
//  Created by Aleyna Yerlikaya on 20.04.2024.
//

import UIKit
import CoreData

class SignupScreenViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextfield: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var user: User?
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func signupAction(_ sender: Any) {
      
        guard let name = nameTextField.text, !name.isEmpty,
                let surname = surnameTextfield.text, !surname.isEmpty,
                let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            alertFunc("Hata", "Boşlukları doldurunuz")
            return
        }
        saveUserData(name: name, surname: surname, email: email, password: password)
        self.navigationController?.popViewController(animated: true)
    }
    
    func saveUserData(name: String, surname: String, email: String, password: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let user = Users(context: context)
        user.name = name
        user.surname = surname
        user.email = email
        user.password = password
        do {
            try context.save()
            print("Kullanıcı başarıyla kaydedildi.")
        } catch let error as NSError {
            print("Hata: \(error.localizedDescription)")
        }
    }


    
    func alertFunc(_ title: String, _ message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true)
    }

}
