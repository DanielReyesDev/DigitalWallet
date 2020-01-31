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
    let number: String
    let bankEntity: String
    let holder: String
    let monthExp: Int
    let yearExp: Int
    let cvc: Int
    let memberSince: Int
}
