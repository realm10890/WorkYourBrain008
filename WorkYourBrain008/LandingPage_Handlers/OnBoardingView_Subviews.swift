//
//  OnBoardingView_Subviews.swift
//  WorkYourBrain008
//
//  Created by Cesar Almendarez on 2/4/20.
//  Copyright © 2020 Cesar Almendarez. All rights reserved.
//

import SwiftUI

struct OnBoardingView_Subviews: View {
    var imageString: String
    
    var body: some View {
        Image(imageString)
        .resizable()
        .frame(width: 400, height: 400)
        .clipped()
    }
}
