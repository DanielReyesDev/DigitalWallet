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
    
    var test = false
    
    var body: some View {
        VStack {
            Spacer()
            CardView(card: card)
            Spacer()
            NewCardForm(text: test ? $card.number : $card.holder )
                .padding()
            
            HStack {
                FloatingButton(title: "<")
                Spacer()
                FloatingButton(title: ">")
            }.padding(EdgeInsets(top: 0,
                                 leading: 16,
                                 bottom: 0,
                                 trailing: 16))
            Spacer()
            
        }.navigationBarTitle(Text("Add Card")) // Default to large title style
    }
}

struct AddCardView_Previews: PreviewProvider {
    static var previews: some View {
        return AddCardView()
    }
}
