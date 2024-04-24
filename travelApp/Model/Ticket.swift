//
//  Users.swift
//  travelApp
//
//  Created by Aleyna Yerlikaya on 21.04.2024.
//

import Foundation

struct Ticket {
    var seatNumber: Int
    var passenger: Passenger
    var date: Date
    var hour: Hour
    var totalPrice: String
    
    func comparison(){ //karşılaştırma
        
    }
    
    func seatReservation(){ //koltuk ayırtma
        
    }
    
    func addingSeatNumber(){ //koltuk no ekleme
        
    }
    
    func print(){
        
    }
}

struct Passenger {
    var name: String
    var surname: String
    var id: Int
}

struct Date {
    var day: String
    var month: String
    var year: String
}

struct Hour {
    var hour: String
    var minute: String
}

struct Company: Decodable {
    var companyName: String
    var price: String
}


