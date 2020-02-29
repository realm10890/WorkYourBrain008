//
//  checkIfSigningIn.swift
//  WorkYourBrain008
//
//  Created by Cesar Almendarez on 2/23/20.
//  Copyright © 2020 Cesar Almendarez. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class signingInChecker: ObservableObject{
    @Published var signingIn: Bool = false
}
