//
//  Constants.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 17/05/20.
//  Copyright © 2020 Daniel Reyes Sanchez. All rights reserved.
//

import Foundation

final class Constants {
    
    struct Card {
        static let titles = ["Card Number",
                             "Bank's name",
                             "Holder's name",
                             "Exp. Month",
                             "Exp. Year",
                             "CVC",
                             "Member Since"]
        
        static let placeholders = ["1234-1234-1234-1234",
                                   "My Bank",
                                   "Jonh Doe",
                                   "07",
                                   "21",
                                   "123",
                                   "2019"]
    }
}
