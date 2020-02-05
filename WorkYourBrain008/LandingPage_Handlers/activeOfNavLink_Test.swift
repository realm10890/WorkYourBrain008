//
//  activeOfNavLink_Test.swift
//  WorkYourBrain008
//
//  Created by Cesar Almendarez on 2/4/20.
//  Copyright © 2020 Cesar Almendarez. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class activityOfNavLink: ObservableObject {
    let objectWillChange = PassthroughSubject<activityOfNavLink, Never>()
    
    var isActive: Bool = false {
        didSet{
            objectWillChange.send(self)
        }
    }
}
