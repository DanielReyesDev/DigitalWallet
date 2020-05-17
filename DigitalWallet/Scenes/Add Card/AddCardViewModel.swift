//
//  AddCardViewModel.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 17/05/20.
//  Copyright © 2020 Daniel Reyes Sanchez. All rights reserved.
//

import Foundation
import SwiftUI

final class AddCardViewModel: ObservableObject {
    
    // MARK: State Properties
    @Published var currentTitle: String
    @Published var currentPlaceHolder: String
    @Published var currentText: String
    
    // MARK: Properties
    private var fieldIndex: Int = 0
    private var titles: [String]
    private var placeholders: [String]
    @State var card: Card
    
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
        guard newIndex < titles.count else { return }
        // After validation, first save the current text
        saveCardField()
        fieldIndex = newIndex
        currentTitle = titles[fieldIndex]
        currentPlaceHolder = placeholders[fieldIndex]
        // Finally set the new current text
        setupCurrentText()
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
