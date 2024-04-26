//
//  City.swift
//  travelApp
//
//  Created by Aleyna Yerlikaya on 26.04.2024.
//

import Foundation

struct City: Decodable {
    let currentCity: String
    let destination: String
    let companyName: String
    let ticketPrice: Double
}

struct Hour: Decodable {
    var hour: String
    var minute: String
}


