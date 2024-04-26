//
//  TicketViewController.swift
//  travelApp
//
//  Created by Aleyna Yerlikaya on 24.04.2024.
//

import UIKit

class BuyTicketViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var companyList: [Company] = [Company]()
    var DateList: [Date] = [Date]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        readJsonFile()
    }
    
    func readJsonFile() {
        guard let fileLocation = Bundle.main.url(forResource: "Ticket", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: fileLocation)
            let receivedData = try JSONDecoder().decode([Company].self, from: data)
            self.companyList = receivedData
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print("json okunamadı")
        }
    }


}

extension BuyTicketViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "buyTicketCell", for: indexPath)
        cell.textLabel?.text = companyList[indexPath.row].companyName
        return cell
    }
    
    
}
