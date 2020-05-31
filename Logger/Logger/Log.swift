//
//  Log.swift
//  DigitalWallet
//
//  Created by Daniel Reyes Sanchez on 22/05/20.
//  Copyright © 2020 Daniel Reyes Sanchez. All rights reserved.
//

import Foundation

public final class Log {
    
    private init() {}
    
    private static var isEnabled: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
    public class func info(_ object: Any) {
        if isEnabled {
            print(LogEvent.info.rawValue, object)
        }
    }
    
    public class func success(_ object: Any) {
        if isEnabled {
            print(LogEvent.success.rawValue, object)
        }
    }
    
    public class func warning(_ object: Any) {
        if isEnabled {
            print(LogEvent.warning.rawValue, object)
        }
    }
    
    public class func error(_ object: Any) {
        if isEnabled {
            print(LogEvent.error.rawValue, object)
        }
    }
}

func print(_ object: Any) {
    #if DEBUG
    Swift.print(object)
    #endif
}
