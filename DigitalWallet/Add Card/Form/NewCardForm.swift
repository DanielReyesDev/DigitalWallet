//
//  NewCardForm.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 04/04/20.
//  Copyright © 2020 Daniel Reyes Sanchez. All rights reserved.
//

import SwiftUI

struct NewCardForm: View {
    
//    @State private var card: Card = Card(number: "",
//                                         bankEntity: "",
//                                         holder: "Daniel Reyes Sanchez",
//                                         monthExp: 00,
//                                         yearExp: 00,
//                                         cvc: 000,
//                                         memberSince: 0000)
    
    @Binding var text: String
    
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        return formatter
    }()
    
    var body: some View {
        VStack {
            VStack {
                Text("Card Number: ")
                    .font(.system(size: 18, weight: .semibold, design: .default))
                
                TextField("1234-1234-1234-1234", text: $text)
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
            }
        }
    }
}

struct NewCardForm_Previews: PreviewProvider {
    static var previews: some View {
        NewCardForm(text: .constant(""))
    }
}
