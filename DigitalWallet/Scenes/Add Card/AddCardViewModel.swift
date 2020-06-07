//
//  AddCardViewModel.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 17/05/20.
//  Copyright © 2020 Daniel Reyes Sanchez. All rights reserved.
//

import Foundation
import SwiftUI
import Logger

final class AddCardViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var currentTitle: String
    @Published var currentPlaceHolder: String
    @Published var currentText: String
    @Published var isLastField: Bool
    @Published var shouldBackToHome: Bool
    
    // MARK: - State Properties
    @State var card: Card
    
    // MARK: - Private Properties
    private var titles: [String]
    private var placeholders: [String]
    private var fieldIndex: Int = 0
    private lazy var storage = CardStorage(card: $card)
    
    // MARK: Init
    init(titles: [String], placeholders: [String]) {
        self.titles = titles
        self.placeholders = placeholders
        self.card = .init(number: "",
                          bankEntity: "",
                          holder: "",
                          monthExp: 0,
                          yearExp: 0,
                          cvc: 0,
                          memberSince: 0)
        
        self.currentTitle = titles[0]
        self.currentPlaceHolder = placeholders[0]
        self.currentText = ""
        self.isLastField = false
        self.shouldBackToHome = false
    }
    
    // MARK: Public Methods
    func nextField() {
        step(with: 1)
    }
    
    func previousField() {
        step(with: -1)
    }
    
    // MARK: - Private Methods
    private func step(with number: Int) {
        let newIndex = fieldIndex + number
        guard newIndex >= 0 else { return }
        guard newIndex < titles.count else {
            saveCardField()
            saveCard()
            return
        }
        isLastField = false
        // After validation, first save the current text
        saveCardField()
        fieldIndex = newIndex
        currentTitle = titles[fieldIndex]
        currentPlaceHolder = placeholders[fieldIndex]
        // Finally set the new current text
        setupCurrentText()
    }
    
    private func saveCard() {
        do {
            try storage.saveCard()
            Log.success("Card saved!")
            shouldBackToHome = true
        } catch {
            Log.success("Error while saving card \(error.localizedDescription)")
        }
    }
    
    private func setupCurrentText() {
        guard let type = CardField(rawValue: fieldIndex) else { return }
        switch type {
        case .number:
            currentText = card.number
        case .bankEntity:
            currentText = card.bankEntity
        case .holder:
            currentText = card.holder
        case .monthExp:
            currentText = card.monthExp == 0 ? "" : "\(card.monthExp)"
        case .yearExp:
            currentText = card.yearExp == 0 ? "" : "\(card.yearExp)"
        case .cvc:
            currentText = card.cvc == 0 ? "" : "\(card.cvc)"
        case .memberSince:
            currentText = card.memberSince == 0 ? "" : "\(card.memberSince)"
        }
    }
    
    private func saveCardField() {
        guard let type = CardField(rawValue: fieldIndex) else { return }
        switch type {
        case .number:
            self.card.number = currentText
        case .bankEntity:
            self.card.bankEntity = currentText
        case .holder:
            self.card.holder = currentText
        case .monthExp:
            self.card.monthExp = Int(currentText) ?? 0
        case .yearExp:
            self.card.yearExp = Int(currentText) ?? 0
        case .cvc:
            self.card.cvc = Int(currentText) ?? 0
        case .memberSince:
            self.card.memberSince = Int(currentText) ?? 0
        }
    }
}
