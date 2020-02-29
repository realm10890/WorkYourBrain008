//
//  SignInEmail_Router.swift
//  WorkYourBrain008
//
//  Created by Cesar Almendarez on 2/28/20.
//  Copyright © 2020 Cesar Almendarez. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class signInEmailSetter: ObservableObject{
    @Published var signInEmail: String = ""
}
