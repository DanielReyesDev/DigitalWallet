//
//  CardView.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 27/01/20.
//  Copyright © 2020 Daniel Reyes Sanchez. All rights reserved.
//

import SwiftUI

struct CardFaceView: View {
    
    @Binding var viewModel: Card
    
    var body: some View {
        return GeometryReader { geometry in
            VStack(alignment: .leading) {
                Image("CardLogo1")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.top)
                    .padding(.leading)
                
                Spacer()
                
                Text(self.viewModel.number)
                    .font(.custom("CreditCard", size: 13))
                    .font(.headline)
                    .foregroundColor(Color(UIColor.white))
                    .padding(.top)
                    .padding(.leading)
                    .padding(.bottom)
                
                HStack {
                    Group {
                        CardCaptionView(title: "MEMBER SINCE:")
                        Text("\(self.viewModel.memberSince)")
                            .font(.custom("CreditCard", size: 11))
                            .foregroundColor(Color(UIColor.white))
                    }
                    
                    Spacer()
                    
                    Group {
                        CardCaptionView(title: "GOOD THRU:")
                        Text("\(self.viewModel.monthExp) / \(self.viewModel.yearExp)")
                            .font(.custom("CreditCard", size: 11))
                            .foregroundColor(Color(UIColor.white))
                    }
                    
                    Spacer()
                }
                .padding(.top)
                
                Spacer()
                
                Text("\(self.viewModel.holder.uppercased())")
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
        let card = Card(number: "4444 4444 4444 4444",
                        bankEntity: "Banorte",
                        holder: "Daniel Reyes Sanchez",
                        monthExp: 07,
                        yearExp: 22,
                        cvc: 123,
                        memberSince: 2018)
        
        return CardFaceView(viewModel: .constant(card))
    }
}
