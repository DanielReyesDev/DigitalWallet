//
//  CardStorage.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 30/05/20.
//  Copyright © 2020 Daniel Reyes Sanchez. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI
import Logger

struct CardStorage {
    @Environment(\.managedObjectContext) var moc
    
    @Binding var card: Card
    
    public func saveCard() throws {
        Log.info("saving Card... ")
        let cardEntity = CardEntity(context: self.moc)
        cardEntity.copy(from: card)
        try self.moc.save()
    }
}
