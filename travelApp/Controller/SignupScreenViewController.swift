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
        
        if let name = nameTextField.text {
            user?.name = name
            if let surname = surnameTextfield.text {
                user?.surname = surname
                if let email = emailTextField.text {
                    user?.email = email
                    if let password = passwordTextField.text {
                        user?.password = password
                    } else {
                        alertFunc("Hata", "Boş yerleri doldurunuz")
                    }
                } else {
                    alertFunc("Hata", "Boş yerleri doldurunuz")
                }
            } else {
                alertFunc("Hata", "Boş yerleri doldurunuz")
            }
        } else {
            alertFunc("Hata", "Boş yerleri doldurunuz")
        }
        
        saveUser()
    }
    
    func saveUser() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        newUser.setValue(user?.name, forKey: "name")
        newUser.setValue(user?.surname, forKey: "surname")
        newUser.setValue(user?.email, forKey: "email")
        newUser.setValue(user?.password, forKey: "password")
        
        do{
            print("\(user?.name ?? "")isim kaydedildi")
            print("\(user?.surname ?? "")soyisim kaydedildi")
            print("\(user?.email ?? "")email kaydedildi")
            print("\(user?.password ?? "")şifre kaydedildi")
            try context.save()
        }catch{
            print("veri kaydedilemedi")
        }
        
        //performSegue(withIdentifier: "LoginScreenVC", sender: nil)
        
    }
    func alertFunc(_ title: String, _ message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true)
    }

}
