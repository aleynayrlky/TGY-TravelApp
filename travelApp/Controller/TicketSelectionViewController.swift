//
//  TicketSelectionViewController.swift
//  travelApp
//
//  Created by Aleyna Yerlikaya on 20.04.2024.
//

import UIKit

class TicketSelectionViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageLabelview: UIImageView!
    @IBOutlet weak var goLabel: UILabel!
    @IBOutlet weak var comeLabel: UILabel!
    @IBOutlet weak var goTextField: UITextField!
    @IBOutlet weak var comeTextField: UITextField!
    @IBOutlet weak var dateSelectionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var trips: [City] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dateSelectedFromDatePicker (_ : AnyObject) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateLabel.text = dateFormatter.string(from: datePicker.date)
        selectedDate()
        
    }
    
    func selectedDate() {
        if let ticketVC = storyboard?.instantiateViewController(withIdentifier: "TicketVC") as? TicketViewController {
            ticketVC.selectedDate = dateLabel.text
        }
    }
    
    @IBAction func changeButtonAction(_ sender: Any) {
        let change = goTextField.text
        goTextField.text = comeTextField.text
        comeTextField.text = change
        
    }
    
    
    @IBAction func buttonAction(_ sender: Any) {
        guard let goTextField = goTextField.text, !goTextField.isEmpty,
              let comeTextField = comeTextField.text, !comeTextField.isEmpty,
              let dateLabel = dateLabel.text, !dateLabel.isEmpty else {
            showAlert(message: "Lütfen tüm alanları doldurun.")
            return
        }
        performSegue(withIdentifier: "toBuyTicketVC", sender: nil)
        
    }
    
    func checkCities(currentCity: String, destination: String) {
        guard let path = Bundle.main.path(forResource: "Ticket", ofType: "json") else {
            print("JSON dosyası bulunamadı.")
            return
        }
        
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
            let cityInfos = try JSONDecoder().decode([City].self, from: jsonData)
            
            let filteredCityInfos = cityInfos.filter { $0.currentCity.lowercased() == currentCity.lowercased() && $0.destination.lowercased() == destination.lowercased() }
            
            if filteredCityInfos.isEmpty {
                showAlert(message: "Girilen şehirlere ait bilgi bulunamadı.")
            } else {
                //navigateToResults(with: filteredCityInfos)
            }
        } catch {
            print("JSON verisini çözme hatası:", error.localizedDescription)
        }
    }
    
    func showAlert(message: String) {
            let alert = UIAlertController(title: "Uyarı", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }

}
