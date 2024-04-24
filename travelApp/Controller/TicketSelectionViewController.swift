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
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dateSelectedFromDatePicker (_ : AnyObject) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MMM-yyyy"
            dateLabel.text = dateFormatter.string(from: datePicker.date)
        }
    
    @IBAction func changeButtonAction(_ sender: Any) {
        let change = goTextField.text
        goTextField.text = comeTextField.text
        comeTextField.text = change
    }
    
    
    @IBAction func buttonAction(_ sender: Any) {
        if ((goTextField.text?.isEmpty) != nil) && ((comeTextField.text?.isEmpty) != nil) && ((dateLabel.text?.isEmpty) != nil) {
            //bilet sayfasına git
        } else {
            let alert = UIAlertController(title: "Hata", message: "Gerekli yerleri doldurunuz.", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true)
        }
    }
    
    

   

}
