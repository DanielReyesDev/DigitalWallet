//
//  CardBackView.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 06/06/20.
//  Copyright © 2020 Daniel Reyes Sanchez. All rights reserved.
//

import SwiftUI

struct CardBackView<SomeTypeOfView : View> : View {
    
    @Binding var lastFourDigits: String
    @Binding var cvc: String
    
    var background: SomeTypeOfView

    var body: some View {
        return GeometryReader { geometry in
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: 20)
                
                Rectangle()
                    .fill(Color.black)
                    .frame(width: geometry.size.width, height: 35)
                
                Spacer()
                    .frame(height: 25)
                
                HStack(alignment: .center, spacing: 0) {
                    
                    ZStack(alignment: .trailing) {
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: geometry.size.width - 140, height: 30)
                            .padding(.leading, 10)
                        
                        Text(self.lastFourDigits)
                            .padding(.trailing)
                            .foregroundColor(.black)
                            .font(Font.system(size: 13))
                    }
                    
                    ZStack {
                        Rectangle()
                            .fill(Color(UIColor.init(red: 212/255,
                                                     green: 212/255,
                                                     blue: 212/255,
                                                     alpha: 1)))
                            .frame(width: 35, height: 23)
                        
                        Text(self.cvc)
                            .foregroundColor(.black)
                            .font(Font.system(size: 13))
                    }
                }
                Spacer()
              }
              .frame(width: geometry.size.width, height: nil, alignment: .topLeading)
          }
          .frame(width: CGFloat(340), height: CGFloat(220))
          .background(background)
          .cornerRadius(10)
          .shadow(radius: 10)
      }
}

struct CardBack_Previews: PreviewProvider {
    static var previews: some View {
        CardBackView(lastFourDigits: .constant("2801"), cvc: .constant("123"), background: Color.gray)
    }
}

