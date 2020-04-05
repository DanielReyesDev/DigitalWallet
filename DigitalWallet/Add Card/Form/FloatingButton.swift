//
//  FloatingButton.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 05/04/20.
//  Copyright © 2020 Daniel Reyes Sanchez. All rights reserved.
//

import SwiftUI

struct FloatingButton: View {
    
    var title: String
    
    var body: some View {
        Button(action: {
            
        }) {
            Text(self.title)
                .frame(width: 50, height: 50, alignment: .center)
                .background(Color.black)
                .foregroundColor(Color.white)
                .font(.system(size: 40))
                .cornerRadius(25)
                
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton(title: "✓")
    }
}
