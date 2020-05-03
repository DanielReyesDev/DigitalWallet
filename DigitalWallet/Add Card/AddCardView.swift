//
//  AddCardView.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 31/01/20.
//  Copyright © 2020 Daniel Reyes Sanchez. All rights reserved.
//

import SwiftUI

enum CardField: Int {
    case number
    case bankEntity
    case holder
    case monthExp
    case yearExp
    case cvc
    case memberSince
}

struct CardFieldResult {
    let type: CardField
    let text: String
}

final class AddCardViewModel: ObservableObject {
    
    // MARK: State Properties
    @Published var currentTitle: String
    @Published var currentPlaceHolder: String
    @Published var currentText: String
    
    // MARK: Properties
    private var fieldIndex: Int = 0
    private var titles: [String]
    private var placeholders: [String]
    private var card: Card
    
    // MARK: Init
    init(titles: [String], placeholders: [String]) {
        self.titles = titles
        self.placeholders = placeholders
        self.card = Card(number: "",
                         bankEntity: "",
                         holder: "Daniel Reyes Sanchez",
                         monthExp: 00,
                         yearExp: 00,
                         cvc: 000,
                         memberSince: 0000)
        
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
    
    func getFieldResult() -> CardFieldResult? {
        guard let type = CardField(rawValue: fieldIndex) else { return nil }
        return CardFieldResult(type: type, text: currentText)
    }
    
    // MARK: - Private Methods
    private func step(with number: Int) {
        let newIndex = fieldIndex + number
        guard newIndex >= 0 else { return }
        guard newIndex < titles.count else { return }
        fieldIndex = newIndex
        
        currentTitle = titles[fieldIndex]
        currentPlaceHolder = placeholders[fieldIndex]
        currentText = ""
    }
}

struct AddCardView: View {
    
    @State private var card: Card = Card(number: "",
                                         bankEntity: "",
                                         holder: "Daniel Reyes Sanchez",
                                         monthExp: 00,
                                         yearExp: 00,
                                         cvc: 000,
                                         memberSince: 0000)
    
    @ObservedObject var viewModel = AddCardViewModel(titles: Constants.Card.titles, placeholders: Constants.Card.placeholders)
    
    var body: some View {
        VStack {
            Spacer()
            CardView(viewModel: card)
            Spacer()
            NewCardForm(title: $viewModel.currentTitle,
                        placeholder: $viewModel.currentPlaceHolder,
                        text: $viewModel.currentText)
            HStack {
                Button("<") {
                    self.viewModel.previousField()
                }.buttonStyle(FloatingButtonStyle())
                Spacer()
                Button(">") {
                    guard let fieldResult = self.viewModel.getFieldResult() else { return }
                    self.saveCardField(with: fieldResult)
                    self.viewModel.nextField()
                }.buttonStyle(FloatingButtonStyle())
                
            }.padding(EdgeInsets(top: 0,
                                 leading: 16,
                                 bottom: 0,
                                 trailing: 16))
            Spacer()
            
        }.navigationBarTitle(Text("Add Card")) // Default to large title style
    }
}

extension AddCardView {
    private func saveCardField(with fieldResult: CardFieldResult) {
        debugPrint("Saving: \(fieldResult.type): \(fieldResult.text)")
        switch fieldResult.type {
        case .number:
            self.card.number = fieldResult.text
        case .bankEntity:
            self.card.bankEntity = fieldResult.text
        case .holder:
            self.card.holder = fieldResult.text
        case .monthExp:
            self.card.monthExp = Int(fieldResult.text) ?? 0
        case .yearExp:
            self.card.yearExp = Int(fieldResult.text) ?? 0
        case .cvc:
            self.card.cvc = Int(fieldResult.text) ?? 0
        case .memberSince:
            self.card.memberSince = Int(fieldResult.text) ?? 0
        }
    }
}

struct AddCardView_Previews: PreviewProvider {
    static var previews: some View {
        return AddCardView()
    }
}

struct FloatingButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 50, height: 50, alignment: .center)
            .background(Color.black)
            .foregroundColor(Color.white)
            .font(.system(size: 40))
            .cornerRadius(25)
    }
}
