//
//  Card.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 27/01/20.
//  Copyright © 2020 Daniel Reyes Sanchez. All rights reserved.
//

import Foundation

class Card: Identifiable {
    let id: UUID = UUID()
    var number: String
    var bankEntity: String
    var holder: String
    var monthExp: Int
    var yearExp: Int
    var cvc: Int
    var memberSince: Int
    
    init(number: String, bankEntity: String, holder: String, monthExp: Int, yearExp: Int, cvc: Int, memberSince: Int) {
        self.number = number
        self.bankEntity = bankEntity
        self.holder = holder
        self.monthExp = monthExp
        self.yearExp = yearExp
        self.cvc = cvc
        self.memberSince = memberSince
    }
}
