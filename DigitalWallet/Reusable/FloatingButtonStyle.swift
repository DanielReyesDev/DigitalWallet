//
//  FloatingButtonStyle.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 17/05/20.
//  Copyright © 2020 Daniel Reyes Sanchez. All rights reserved.
//

import SwiftUI

struct FloatingButtonStyle: ButtonStyle {
    
//    @Binding var isReady: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
//        print(isReady)
        return configuration.label
            .frame(width: 50, height: 50, alignment: .center)
            .background(Color.green)
//            .background( isReady ? Color.green : Color.black )
            .foregroundColor(Color.white)
            .font(.system(size: 40))
            .cornerRadius(25)
    }
}

//struct ReadyButtonStyle: ButtonStyle {
//
//    var isReady = false
//
//    func makeBody(configuration: Self.Configuration) -> some View {
//        configuration.label
//            .frame(width: 50, height: 50, alignment: .center)
//            .background( isReady ? Color.green : Color.black )
//            .foregroundColor(Color.white)
//            .font(.system(size: 40))
//            .cornerRadius(25)
//    }
//}
//
//struct MaterialButtonStyle: ButtonStyle {
//
//    var finish: Bool = false
//
//    struct MaterialButton: View {
//
//        let configuration: ButtonStyle.Configuration
//        @Environment(\.isEnabled) private var isEnabled: Bool
//
//        var body: some View {
//            configuration.label
//                .frame(width: 50, height: 50, alignment: .center)
//                .background(Color.green)
//                .foregroundColor(Color.white)
//                .font(.system(size: 40))
//                .cornerRadius(25)
//
//        }
//    }
//
//    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
//        MaterialButton(configuration: configuration)
//    }
//}
