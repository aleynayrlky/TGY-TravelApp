//
//  TicketViewController.swift
//  travelApp
//
//  Created by Aleyna Yerlikaya on 24.04.2024.
//

import UIKit
import CoreData

class TicketViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var companyPriceHourLabel: UILabel!
    @IBOutlet weak var citiesLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var city: City?
    var selectedDate: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let currentUser = getCurrentUser() {
            nameLabel.text = currentUser.name
            surnameLabel.text = currentUser.surname
        }
        dateLabel.text = selectedDate
        
        if let city = city {
            citiesLabel.text = "\(city.currentCity) - \(city.destination)"
            companyPriceHourLabel.text = "\(city.companyName) - \(city.ticketPrice) - \(city.time)"
        }
        
    }
    
    func getCurrentUser() -> Users? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Users> = Users.fetchRequest()
        let currentUserEmail = UserDefaults.standard.string(forKey: "email") ?? ""
        fetchRequest.predicate = NSPredicate(format: "email == %@", currentUserEmail)
        do {
            let users = try context.fetch(fetchRequest)
            return users.first
        } catch {
            print("Error fetching user: \(error.localizedDescription)")
            return nil
        }
    }

    

}

