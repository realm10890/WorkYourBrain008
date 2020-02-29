//
//  HomeView.swift
//  WorkYourBrain008
//
//  Created by Cesar Almendarez on 2/23/20.
//  Copyright © 2020 Cesar Almendarez. All rights reserved.
//

import SwiftUI
import Firebase
struct HomeView: View {
     @EnvironmentObject var session: SessionStore
    var body: some View {
        VStack{
            
            Text("Signed In As: \(((Auth.auth().currentUser?.email)!))")
            Button(action:{
                self.session.signOut()
            }){
                Text("Sign Out")
            }
            Button(action:{
                
            }){
                Text("Refresh")
            }
            
        }
    }
}
