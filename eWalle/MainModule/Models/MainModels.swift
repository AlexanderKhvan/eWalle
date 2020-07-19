//
//  MainModels.swift
//  eWalle
//
//  Created by Alexander Khvan on 16.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

//Models
struct SendMoneyToPerson {
    var name: String?
    var avatar: String?
}

//ViewModels
struct MainSectionViewModel {
    var icon: String?
    var section: MainSection
    var cells: [MainCell]
}

enum MainSection: String {
    case accountOverview = "Account Overview"
    case sendMoney = "Send Money"
    case services = "Services"
}

enum MainCell {
    case balance
    case sendMoney
    case service(ServiceViewModel)
}

enum PersonToSendMoneyCell {
    case addPerson
    case person(SendMoneyToPerson)
}

struct ServiceViewModel {
    var icon: String?
    var cell: ServiceCell
}

enum ServiceCell: String {
    case sendMoney = "Send Money"
    case receiveMoney = "Receive Money"
    case mobilePrepaid = "Mobile Prepaid"
    case electricityBill = "Electricity Bill"
    case cashbackOffer = "Cashback Offer"
    case movieTicket = "Movie Ticket"
    case flightTicket = "Flight Ticket"
    case moreOptions = "More Options"
}

