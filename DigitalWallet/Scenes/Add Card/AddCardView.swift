//
//  AddCardView.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 31/01/20.
//  Copyright © 2020 Daniel Reyes Sanchez. All rights reserved.
//

import SwiftUI
import Logger

struct AddCardView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @ObservedObject var viewModel = AddCardViewModel(titles: Constants.Card.titles, placeholders: Constants.Card.placeholders)
    
    var body: some View {
        VStack {
            CardFaceView(viewModel: $viewModel.card)
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
                }.buttonStyle(FloatingButtonStyle(isReady: .constant(false))) //$viewModel.shouldSaveCard))
            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            Spacer()
        }.navigationBarTitle(Text("Add Card")) // Default to large title style
    }
}

struct AddCardView_Previews: PreviewProvider {
    static var previews: some View {
        return AddCardView()
    }
}
