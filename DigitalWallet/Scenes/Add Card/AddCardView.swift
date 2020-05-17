//
//  AddCardView.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 31/01/20.
//  Copyright © 2020 Daniel Reyes Sanchez. All rights reserved.
//

import SwiftUI
import CoreData

struct AddCardView: View {
    
//    @Environment(\.managedObjectContext) var moc
    
    @ObservedObject var viewModel = AddCardViewModel(titles: Constants.Card.titles,
                                                     placeholders: Constants.Card.placeholders)
        
    var body: some View {
        VStack {
            Spacer()
            CardView(viewModel: $viewModel.card)
            Spacer()
            NewCardFormView(title: $viewModel.currentTitle,
                        placeholder: $viewModel.currentPlaceHolder,
                        text: $viewModel.currentText)
            HStack {
                Button("<") {
                    self.viewModel.previousField()
                }.buttonStyle(FloatingButtonStyle()) //isReady: self.viewModel.$isLastField))
                Spacer()
                Button(">") {
                    self.viewModel.nextField()
                }.buttonStyle(FloatingButtonStyle()) //isReady: self.viewModel.$isLastField))
                
            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            Spacer()
            
        }.navigationBarTitle(Text("Add Card")) // Default to large title style
    }
    
    private func saveCard() {
//        let cardEntity = CardEntity(context: self.moc)
//        cardEntity.id = UUID()
//        cardEntity.number = viewModel.card.number
//        cardEntity.bankEntity = viewModel.card.bankEntity
//        cardEntity.holder = viewModel.card.holder
//        cardEntity.monthExp = Int32(viewModel.card.monthExp)
//        cardEntity.yearExp = Int32(viewModel.card.yearExp)
//        cardEntity.cvc = Int32(viewModel.card.cvc)
//        cardEntity.memberSince = Int32(viewModel.card.memberSince)
//        
//        do {
//            try self.moc.save()
//            print("Card Saved!")
//        } catch {
//            print(error.localizedDescription)
//        }
    }
    
}

struct AddCardView_Previews: PreviewProvider {
    static var previews: some View {
        return AddCardView()
    }
}
