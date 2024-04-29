//
//  BuyTicketTableViewCell.swift
//  travelApp
//
//  Created by Aleyna Yerlikaya on 28.04.2024.
//

import UIKit

protocol BuyTicketTableViewCellDelegate: AnyObject {
    func didSelectImages(_ selectedImageNames: [String])
    func didTapButtonInCell(_ cell: BuyTicketTableViewCell)
}

class BuyTicketTableViewCell: UITableViewCell {
    
    @IBOutlet weak var listView: UIView! {
        didSet {
            listView.layer.borderWidth = 3
            listView.layer.borderColor = UIColor(red: 1, green: 0.85, blue: 0.94, alpha: 1).cgColor
            listView.layer.cornerRadius = 6
        }
    }
    @IBOutlet weak var jsonInfoHeaderStackView: UIStackView!
    @IBOutlet weak var citiesLabel: UILabel!
    @IBOutlet weak var companyPriceHourLabel: UILabel!
    @IBOutlet weak var seatHeaderStackView: UIStackView!
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    @IBOutlet weak var image10: UIImageView!
    @IBOutlet weak var image11: UIImageView!
    @IBOutlet weak var image12: UIImageView!
    @IBOutlet weak var image13: UIImageView!
    @IBOutlet weak var image14: UIImageView!
    @IBOutlet weak var image15: UIImageView!
    @IBOutlet weak var image16: UIImageView!
    @IBOutlet weak var image17: UIImageView!
    @IBOutlet weak var image18: UIImageView!
    @IBOutlet weak var image19: UIImageView!
    @IBOutlet weak var image20: UIImageView!
    
    weak var delegate: BuyTicketTableViewCellDelegate?
    var selectedImages: [UIImage] = []
    var tappedImageViewCount = 0
    
    @IBOutlet weak var goBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        let tap5 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        let tap6 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        let tap7 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        let tap8 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        let tap9 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        let tap10 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        let tap11 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        let tap12 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        let tap13 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        let tap14 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        let tap15 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        let tap16 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        let tap17 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        let tap18 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        let tap19 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        let tap20 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        
        image1.addGestureRecognizer(tap1)
        image2.addGestureRecognizer(tap2)
        image3.addGestureRecognizer(tap3)
        image4.addGestureRecognizer(tap4)
        image5.addGestureRecognizer(tap5)
        image6.addGestureRecognizer(tap6)
        image7.addGestureRecognizer(tap7)
        image8.addGestureRecognizer(tap8)
        image9.addGestureRecognizer(tap9)
        image10.addGestureRecognizer(tap10)
        image11.addGestureRecognizer(tap11)
        image12.addGestureRecognizer(tap12)
        image13.addGestureRecognizer(tap13)
        image14.addGestureRecognizer(tap14)
        image15.addGestureRecognizer(tap15)
        image16.addGestureRecognizer(tap16)
        image17.addGestureRecognizer(tap17)
        image18.addGestureRecognizer(tap18)
        image19.addGestureRecognizer(tap19)
        image20.addGestureRecognizer(tap20)
        
        image1.isUserInteractionEnabled = true
        image2.isUserInteractionEnabled = true
        image3.isUserInteractionEnabled = true
        image4.isUserInteractionEnabled = true
        image5.isUserInteractionEnabled = true
        image6.isUserInteractionEnabled = true
        image7.isUserInteractionEnabled = true
        image8.isUserInteractionEnabled = true
        image9.isUserInteractionEnabled = true
        image10.isUserInteractionEnabled = true
        image11.isUserInteractionEnabled = true
        image12.isUserInteractionEnabled = true
        image13.isUserInteractionEnabled = true
        image14.isUserInteractionEnabled = true
        image15.isUserInteractionEnabled = true
        image16.isUserInteractionEnabled = true
        image17.isUserInteractionEnabled = true
        image18.isUserInteractionEnabled = true
        image19.isUserInteractionEnabled = true
        image20.isUserInteractionEnabled = true
        
        
    }
    
    @objc func imageViewTapped(_ sender: UITapGestureRecognizer) {
        if tappedImageViewCount < 5 {
            guard let tappedImageView = sender.view as? UIImageView else { return }
            if tappedImageView.image == UIImage(systemName: "person") {
                tappedImageView.image = UIImage(systemName: "person.fill")
                tappedImageViewCount += 1
            } else {
                tappedImageView.image = UIImage(systemName: "person")
                tappedImageViewCount -= 1
            }
        } else {
            // 5 resimden fazla tıklanırsa uyarı göster
            guard let tappedImageView = sender.view as? UIImageView else { return }
            if tappedImageView.image == UIImage(systemName: "person.fill") {
                tappedImageView.image = UIImage(systemName: "person")
                tappedImageViewCount -= 1
            } else {
                showAlert(title: "Uyarı", message: "5'ten fazla koltuk seçemezsiniz.")
            }
        }
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        alertController.addAction(okAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func chooseSeatButtonAction(_ sender: Any) {
    }
    
    
    @IBAction func goButtonAction(_ sender: UIButton) {
        if tappedImageViewCount == 0 {
            showAlert(title: "Hata", message: "Koltuk seçmediniz.")
        } else {
            delegate?.didTapButtonInCell(self)
        }
        
    }
    
    func configure(with cityInfo: City) {
        citiesLabel.text = "Kalkış: \(cityInfo.currentCity) - Varış: \(cityInfo.destination)"
        companyPriceHourLabel.text = "Firma: \(cityInfo.companyName) - \(cityInfo.time) - \(cityInfo.ticketPrice) TL"
    }
    
    
}
