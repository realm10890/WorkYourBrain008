//
//  Password_SignIn.swift
//  WorkYourBrain008
//
//  Created by Cesar Almendarez on 2/27/20.
//  Copyright © 2020 Cesar Almendarez. All rights reserved.
//

import SwiftUI
import Firebase

struct Password_SignIn: View {
    @State private var password: String = ""
    let blueAccents = Color(red: 52.0/255.0, green: 120.0/255.0, blue:
    247.0/255.0, opacity: 1.0)
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    @State private var linePaddingLeading = false
    @State private var nextButtonOp = false
    @EnvironmentObject var signInEmailGetter: signInEmailSetter
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    VStack(alignment: .leading, spacing: 2 ){
                        Text("Enter Your")
                            .font(.system(size: 35))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Text("Password")
                            .font(.system(size: 35))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }.offset(x: 0, y: 0)
                    .padding(.leading)
                    Spacer()
                }
                VStack{
                    PasswordTextField_Rep(tag: 0, placeholder: "Password", changeHandler: {(newString) in
                        self.password = newString
                    }, onCommitHandler: {
                        }).disableAutocorrection(true)
                        .frame(width: self.screenWidth - 35, height: 10)
                        .simultaneousGesture(TapGesture().onEnded{
                            if(self.linePaddingLeading == true){
                                return
                            }else if(self.linePaddingLeading != true){
                                withAnimation(){
                                    self.linePaddingLeading.toggle()
                            }
                        }
                    })
                    TextFieldUnderlineView(color: blueAccents)
                        .frame(width: linePaddingLeading ? self.screenWidth - 35 : 0, height: 10)
                    Button(action:{
                        //Sign In Firebase Call
                         UIApplication.shared.endEditing_4()
                        Auth.auth().signIn(withEmail: self.signInEmailGetter.signInEmail, password: self.password) { (result, error) in
                            if let firebaseError = error{
                                print(firebaseError.localizedDescription)
                                return
                            }
                        }
                        
                    }){
                        Text("Sign In")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: self.screenWidth - 35, height: 45)
                            .background(blueAccents)
                            .cornerRadius(10)
                            .padding(.bottom)
                    }
                    Button(action:{
                        
                    }){
                        Text("Don't have an account? Sign up.")
                            .font(.system(size: 15))
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }.offset(x: 0, y: 0)
                }
            .offset(x: 0, y: 140)
            }.offset(x: 0, y: -210)
            
            
        }
        .onDisappear(){
            withAnimation(){
                self.linePaddingLeading = false
            }
        }
        .onAppear(){
            print(self.signInEmailGetter.signInEmail)
            withAnimation(){
                self.linePaddingLeading = true
            }
        
        }
    }
}
extension UIApplication {
    func endEditing_4(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
