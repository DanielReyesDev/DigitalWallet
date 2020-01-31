//
//  CardCaption.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 27/01/20.
//  Copyright © 2020 Daniel Reyes Sanchez. All rights reserved.
//

import SwiftUI

struct CardCaption: View {
    var title: String
    var body: some View {
        Text(title)
            .frame(width: 40)
            .font(.system(size: 9))
            .foregroundColor(Color(UIColor.white))
            .padding(.leading)
    }
}
