//
//  TicketViewController.swift
//  travelApp
//
//  Created by Aleyna Yerlikaya on 24.04.2024.
//

import UIKit

class BuyTicketViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedImages: [UIImageView] = []
    var cityInfos: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "BuyTicketTableViewCell", bundle: nil), forCellReuseIdentifier: "buyTicketCell")
        loadFlightInfos()
    }
    
    func loadFlightInfos() {
        guard let path = Bundle.main.path(forResource: "Ticket", ofType: "json") else {
            print("JSON file not found")
            return
        }
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            cityInfos = try decoder.decode([City].self, from: jsonData)
            tableView.reloadData()
        } catch {
            print("Error loading JSON: \(error.localizedDescription)")
        }
    }
    
}

extension BuyTicketViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityInfos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "buyTicketCell") as! BuyTicketTableViewCell
        let cityInfo = cityInfos[indexPath.row]
        cell.configure(with: cityInfo)
        cell.delegate = self
        cell.goBtn.tag = indexPath.row
        cell.goBtn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        _ = cityInfos[sender.tag]
        goToTicketScreen()
    }
    
    func goToTicketScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let ticketVC = storyboard.instantiateViewController(withIdentifier: "TicketVC") as? TicketViewController {
            navigationController?.pushViewController(ticketVC, animated: true)
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCity = cityInfos[indexPath.row]
        
        // İkinci view controller'ı manuel olarak oluştur
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailsVC = storyboard.instantiateViewController(withIdentifier: "TicketVC") as? TicketViewController else {
            return
        }
        
        // Seçilen şehir bilgilerini ikinci view controller'a aktar
        detailsVC.city = selectedCity
        
        // İkinci view controller'ı göster
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension BuyTicketViewController: BuyTicketTableViewCellDelegate {
    
    func didTapButtonInCell(_ cell: BuyTicketTableViewCell) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let ticketVC = storyboard.instantiateViewController(withIdentifier: "TicketVC") as? TicketViewController {
            navigationController?.pushViewController(ticketVC, animated: true)
        }
    }
    
    func didSelectImages(_ selectedImageNames: [String]) {
        
    }
    
}

