//
//  AddCardView.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 31/01/20.
//  Copyright © 2020 Daniel Reyes Sanchez. All rights reserved.
//

import SwiftUI

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
            CardView(viewModel: $viewModel.card)
            Spacer()
            NewCardFormView(title: $viewModel.currentTitle,
                        placeholder: $viewModel.currentPlaceHolder,
                        text: $viewModel.currentText)
            HStack {
                Button("<") {
                    self.viewModel.previousField()
                }.buttonStyle(FloatingButtonStyle())
                Spacer()
                Button(">") {
                    self.viewModel.nextField()
                }.buttonStyle(FloatingButtonStyle())
                
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
