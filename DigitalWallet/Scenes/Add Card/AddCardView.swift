//
//  AddCardView.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 31/01/20.
//  Copyright © 2020 Daniel Reyes Sanchez. All rights reserved.
//

import SwiftUI
import CoreData
import Logger

struct AddCardView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @ObservedObject var viewModel = AddCardViewModel(titles: Constants.Card.titles, placeholders: Constants.Card.placeholders)
        
    var body: some View {
        VStack {
            CardView(viewModel: $viewModel.card)
            NewCardFormView(title: $viewModel.currentTitle,
                            placeholder: $viewModel.currentPlaceHolder,
                            text: $viewModel.currentText)
            HStack {
                Button("<") {
                    self.viewModel.previousField()
                }.buttonStyle(FloatingButtonStyle(isReady: .constant(false)))
                Spacer()
                Button(">") {
                    self.viewModel.nextField()
//                    if self.viewModel.shouldSaveCard {
//                        self.saveCard()
//                    }
                }.buttonStyle(FloatingButtonStyle(isReady: .constant(false))) //$viewModel.shouldSaveCard))
            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            Spacer()
        }.navigationBarTitle(Text("Add Card")) // Default to large title style
    }
    
    private func saveCard() {
//        Log.info("saving Card... ")
//        let cardEntity = CardEntity(context: self.moc)
//        cardEntity.copy(from: viewModel.card)
//        do {
//            try self.moc.save()
//            self.mode.wrappedValue.dismiss()
//            Log.success("Card saved!")
//        } catch {
//            Log.success("Error while saving card \(error.localizedDescription)")
//        }
    }
}

struct AddCardView_Previews: PreviewProvider {
    static var previews: some View {
        return AddCardView()
    }
}
