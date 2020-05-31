//
//  HomeView.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 17/12/19.
//  Copyright © 2019 Daniel Reyes Sanchez. All rights reserved.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: CardEntity.entity(), sortDescriptors: []) var cards: FetchedResults<CardEntity>
    
//    let cards = [Card(number: "4444 4444 4444 4444",
//                      bankEntity: "Banorte",
//                      holder: "Daniel Reyes Sanchez",
//                      monthExp: 07,
//                      yearExp: 22,
//                      cvc: 123,
//                      memberSince: 2018),
//                 Card(number: "3333 4444 4444 4444",
//                      bankEntity: "Citibanamex",
//                      holder: "Daniel Reyes Sanchez",
//                      monthExp: 12,
//                      yearExp: 20,
//                      cvc: 123,
//                      memberSince: 2017),
//                 Card(number: "2222 4444 4444 4444",
//                      bankEntity: "Santander",
//                      holder: "Daniel Reyes Sanchez",
//                      monthExp: 11,
//                      yearExp: 21,
//                      cvc: 123,
//                      memberSince: 2016)
//                ]
    
    @State var viewState = CGSize.zero
    @State var showContent = false
    
    var body: some View {
        NavigationView {
            List {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 100.0) {
                        ForEach(cards) { card in
                            Button(action: { self.showContent.toggle() }) {
                                GeometryReader { geometry in
                                    CardView(viewModel: .constant(Card(cardEntity: card)) )
                                    .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -40), axis: (x: 0, y: 10.0, z: 0))
                                    .sheet(isPresented: self.$showContent) { HomeView() }
                                }
                                .frame(width: 246, height: 360)
                            }
                        }
                    }
                    .padding(.leading, 60)
                    .padding(.top, 30)
                    .padding(.bottom, 70)
                    Spacer()
                }
            }
            .navigationBarTitle(Text("Wallet"))
            .navigationBarItems(trailing:
                NavigationLink(destination: AddCardView()) { //.environment(\.managedObjectContext, moc)) {
                    Text("Add Card")
                }
            )
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
