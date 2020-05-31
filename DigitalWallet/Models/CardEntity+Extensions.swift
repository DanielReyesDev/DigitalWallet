//
//  CardEntity+Extensions.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 30/05/20.
//  Copyright © 2020 Daniel Reyes Sanchez. All rights reserved.
//

import Foundation

extension CardEntity: Identifiable { }

extension CardEntity {
    func copy(from card: Card) {
        self.id = card.id
        self.number = card.number
        self.bankEntity = card.bankEntity
        self.holder = card.holder
        self.monthExp = Int32(card.monthExp)
        self.yearExp = Int32(card.yearExp)
        self.cvc = Int32(card.cvc)
        self.memberSince = Int32(card.memberSince)
    }
}
