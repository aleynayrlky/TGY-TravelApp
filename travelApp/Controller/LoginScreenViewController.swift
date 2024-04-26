//
//  LoginScreenViewController.swift
//  travelApp
//
//  Created by Aleyna Yerlikaya on 20.04.2024.
//

import UIKit
import CoreData

class LoginScreenViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginAction(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            alertFunc("Hata", "Boş bırakılamaz!")
            return
        }
        if checkUserCredentials(email: email, password: password) {
            print("Giriş başarılı")
            goToTicketScreen()
        } else {
            alertFunc("Hata", "Kullanıcı bilgileri hatalı!")
        }
    }
    
    func checkUserCredentials(email: String, password: String) -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Users> = Users.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email = %@ AND password = %@", email, password)
        do {
            let users = try context.fetch(fetchRequest)
            return !users.isEmpty
        } catch {
            print("Hata: \(error.localizedDescription)")
            return false
        }
    }
    
    func goToTicketScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let ticketVC = storyboard.instantiateViewController(withIdentifier: "TicketSelectionVC") as? TicketSelectionViewController {
            navigationController?.pushViewController(ticketVC, animated: true)
        }
    }
    
    func alertFunc(_ title: String, _ message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    
}
