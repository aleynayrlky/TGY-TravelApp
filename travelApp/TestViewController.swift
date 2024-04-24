//
//  TestViewController.swift
//  travelApp
//
//  Created by Aleyna Yerlikaya on 24.04.2024.
//

import UIKit
import CoreData

class TestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        cell.textLabel?.text = name[indexPath.row]
        return cell
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var name = [String]() {
        didSet{
            tableView.reloadData()
        }
    }
    var surname = [String]() {
        didSet{
            tableView.reloadData()
        }
    }
    var email = [String]() {
        didSet{
            tableView.reloadData()
        }
    }
    var password = [String]() {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        getItem()
    }
    
    private func getItem(){
        name.removeAll()
        surname.removeAll()
        email.removeAll()
        password.removeAll()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        do{
            let results = try context.fetch(fetchRequest)
            if !results.isEmpty {
                for result in results as! [NSManagedObject]{
                    guard let name1 = result.value(forKey: "name") as? String else { return }
                    name.append(name1)
                    guard let surname1 = result.value(forKey: "surname") as? String else { return }
                    surname.append(name1)
                    guard let email1 = result.value(forKey: "email") as? String else { return }
                    email.append(email1)
                    guard let password1 = result.value(forKey: "password") as? String else { return }
                    password.append(password1)
                }
            }else {
                
            }
        }catch{
            print("veriler çekilemedi")
        }
    }
}
