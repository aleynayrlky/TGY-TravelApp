//
//  TicketTableViewCell.swift
//  travelApp
//
//  Created by Aleyna Yerlikaya on 24.04.2024.
//

import UIKit

class TicketTableViewCell: UITableViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var qrImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var user: User?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nameLabel.text = user?.name
        surnameLabel.text = user?.surname
    }

    
    
    
}
