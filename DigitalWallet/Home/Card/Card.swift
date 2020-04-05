//
//  Card.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 27/01/20.
//  Copyright © 2020 Daniel Reyes Sanchez. All rights reserved.
//

import Foundation

struct Card: Identifiable {
    let id: UUID = UUID()
    var number: String
    var bankEntity: String
    var holder: String
    var monthExp: Int
    var yearExp: Int
    var cvc: Int
    let memberSince: Int
}
