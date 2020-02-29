//
//  HighestView.swift
//  WorkYourBrain008
//
//  Created by Cesar Almendarez on 2/23/20.
//  Copyright © 2020 Cesar Almendarez. All rights reserved.
//

import SwiftUI

struct HighestView: View {
    @EnvironmentObject var session: SessionStore
    @EnvironmentObject var signingIn2: signingInChecker
    
    func getUser() {
        session.listen()
    }
    
    var body: some View {
        Group{
            if(session.session != nil && signingIn2.signingIn == false){
                HomeView()
            }else if((session.session == nil) || (session.session != nil && signingIn2.signingIn == true)){
                OnBoardingView()
            }else {
                Text("Something very wrong")
            }
        }.onAppear(perform: getUser)
    }
}
