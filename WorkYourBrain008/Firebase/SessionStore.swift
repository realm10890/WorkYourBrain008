//
//  SessionStore.swift
//  WorkYourBrain008
//
//  Created by Cesar Almendarez on 2/15/20.
//  Copyright © 2020 Cesar Almendarez. All rights reserved.
//

import SwiftUI
import Firebase
import Combine
import FirebaseAuth

class SessionStore: ObservableObject {
    var actionCodeSettings = ActionCodeSettings.init()
    
    let user = Auth.auth().currentUser
    //@ObservedObject var viewRouter: ViewRouter
    
    
    
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: User? {
        didSet{
            self.didChange.send(self)
        }
    }
    var handle: AuthStateDidChangeListenerHandle?
    
   
    
    
    func listen(){
        handle = Auth.auth().addStateDidChangeListener({(auth, user) in
            if let user = user{
                self.session = User(uid: user.uid, email: user.email)
            }else {
                self.session = nil
            }
            
        })
    }
    public func sendVerificationEmail(){
        if self.user != nil && !self.user!.isEmailVerified{
            self.user!.sendEmailVerification(completion: {(error) in
                
                
            })
        } else {
            print("Failed to send email")
        }
    }
    
    
  
    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback){
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
       // print("Signed In As: " \(Auth))
    }
    func signOut() {
        do{
            try Auth.auth().signOut()
            self.session = nil
            print("Successfully Signed Out")
           
           
        } catch{
            print("Error Signing Out")
        }
    }
    func unbind (){
        if let handle = handle{
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    deinit {
        unbind()
    }
}
struct User {
    var uid: String
    var email: String?
    
    init(uid: String, email: String?) {
        self.uid = uid
        self.email = email
    }
}

