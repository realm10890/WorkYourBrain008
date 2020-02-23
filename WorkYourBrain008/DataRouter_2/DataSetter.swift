//
//  DataSetter.swift
//  WorkYourBrain008
//
//  Created by Cesar Almendarez on 2/16/20.
//  Copyright © 2020 Cesar Almendarez. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

class DataSetter: ObservableObject{
    
}

class emailSetting: Identifiable{
    var setEmail: String
    
    
    init(_ setEmail: String) {
        self.setEmail = setEmail
    }
    
}
