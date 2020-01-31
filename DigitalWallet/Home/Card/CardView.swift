//
//  CardView.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 27/01/20.
//  Copyright © 2020 Daniel Reyes Sanchez. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    var card = Card(number: "4444 4444 4444 4444",
                    bankEntity: "Banorte",
                    holder: "Daniel Reyes Sanchez",
                    monthExp: 07,
                    yearExp: 22,
                    cvc: 123,
                    memberSince: 2018)
    
    var body: some View {
        return GeometryReader { geometry in
            VStack(alignment: .leading) {
                Image("CardLogo1")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.top)
                    .padding(.leading)
                
                Spacer()
                
                Text(self.card.number)
                    .font(.custom("CreditCard", size: 13))
                    .font(.headline)
                    .foregroundColor(Color(UIColor.white))
                    .padding(.top)
                    .padding(.leading)
                    .padding(.bottom)
                
                HStack {
                    Group {
                        CardCaption(title: "MEMBER SINCE:")
                        Text("\(self.card.memberSince)")
                            .font(.custom("CreditCard", size: 11))
                            .foregroundColor(Color(UIColor.white))
                    }
                    
                    Spacer()
                    
                    Group {
                        CardCaption(title: "GOOD THRU:")
                        Text("\(self.card.monthExp) / \(self.card.yearExp)")
                            .font(.custom("CreditCard", size: 11))
                            .foregroundColor(Color(UIColor.white))
                    }
                    
                    Spacer()
                }
                .padding(.top)
                
                Spacer()
                
                Text("\(self.card.holder.uppercased())")
                    .font(.custom("CreditCard", size: 16))
                    .foregroundColor(Color(UIColor.white))
                    .padding(.leading)
                
                Spacer()
            }
            .frame(width: geometry.size.width, height: nil, alignment: .topLeading)
        }
        .frame(width: CGFloat(340), height: CGFloat(220))
        .background(Color.black)
        .cornerRadius(10)
        .shadow(radius: 10)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
