//
//  NewCardForm.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 04/04/20.
//  Copyright © 2020 Daniel Reyes Sanchez. All rights reserved.
//

import SwiftUI

struct NewCardForm {
    
    // MARK: State Properties
    @Binding var title: String
    @Binding var placeholder: String
    @Binding var text: String
    
    // MARK: Properties
    private let numberFormatter = NumberFormatter()
    private let action: (_ field: String) -> Void = { _ in }
    
    // MARK: init
    init(title: Binding<String>, placeholder: Binding<String>, text: Binding<String>) {
        _title = title
        _placeholder = placeholder
        _text = text
    }
}

// MARK: - View
extension NewCardForm: View {
    var body: some View {
        VStack {
            VStack {
                Text(title)
                    .font(.system(size: 18, weight: .semibold, design: .default))
                
                TextField(placeholder, text: $text)
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
            }
        }
    }
}

// MARK: - Preview
struct NewCardForm_Previews: PreviewProvider {
    static var previews: some View {
        NewCardForm(title: .constant(""),
                    placeholder: .constant(""),
                    text: .constant(""))
    }
}
