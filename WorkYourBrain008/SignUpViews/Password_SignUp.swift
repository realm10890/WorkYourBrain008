//
//  Password_SignUp.swift
//  WorkYourBrain008
//
//  Created by Cesar Almendarez on 2/4/20.
//  Copyright © 2020 Cesar Almendarez. All rights reserved.
//

import SwiftUI
import Firebase

struct Password_SignUp: View {
    
    @State private var password: String = ""
    let blueAccents = Color(red: 52.0/255.0, green: 120.0/255.0, blue:
    247.0/255.0, opacity: 1.0)
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    @State private var linePaddingTrailing = true
    @State private var linePaddingLeading = false
    @State private var NextButtonOp = false
    @State private var showingAlert = false
    @State private var showingAlert2 = false
    @EnvironmentObject var emailGetter: emailSetter
    @EnvironmentObject var verificationGet: verificationChecker
    func change() {
        self.showingAlert.toggle()
    }
    @State private var accestor = false
    @State private var createdAccount = false
    @State private var goToUsername = false
    var body: some View {
        
        ZStack{
            NavigationLink(destination: Username_SignUp(), isActive: $goToUsername){
                EmptyView()
            }.hidden()
            VStack{
                
                HStack{
                    VStack(alignment: .leading, spacing: 2){
                        Text("Choose A")
                            .font(.system(size: 35))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Text("Password")
                            .font(.system(size: 35))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Text("Pick a strong password you can remember")
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                            .foregroundColor(blueAccents)
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
                        UIApplication.shared.endEditing_2()
                        
                        
                        if(self.createdAccount == false){
                        Auth.auth().createUser(withEmail: self.emailGetter.email, password: self.password, completion: { user, error in
                            if let fireBaseError = error {
                                print(fireBaseError.localizedDescription)
                                return
                            }
                            self.createdAccount = true
                            if(Auth.auth().currentUser!.isEmailVerified){
                                self.goToUsername = true
                            }else if (!Auth.auth().currentUser!.isEmailVerified){
                                Auth.auth().currentUser!.sendEmailVerification{ (error) in
                                    if error != nil{
                                        //print(error?.localizedDescription)
                                        print("Error sending verification email")
                                        return
                                    }
                                    withAnimation(){
                                    self.showingAlert = true
                                    }
                                }
                                
                                
                            }
                            
                            
                        })
                    }//count
                        else if (self.createdAccount == true){
                        Auth.auth().currentUser?.reload(completion: { (error) in
                            print("Already created accountr waiting for verification")
                            
                            if(Auth.auth().currentUser!.isEmailVerified){
                                self.goToUsername = true
                            }else if (!Auth.auth().currentUser!.isEmailVerified){
                                Auth.auth().currentUser!.sendEmailVerification{ (error) in
                                    if error != nil{
                                        //print(error?.localizedDescription)
                                        print("Error sending verification email")
                                        return
                                    }
                                    withAnimation(){
                                    self.showingAlert2 = true
                                    }
                                }
                                
        
                            }
                        })
                        }
     
                    }){
                        Text("Next")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: self.screenWidth - 35, height: 45)
                        .background(blueAccents)
                        .cornerRadius(10)
                        .padding(.bottom)
                       
                    }
                    
                    
                    //Text("\(self.verificationGet.verified)")
                    
                    
                    Button(action:{
                        print("Already have an account toggled")
                    }){
                        Text("Already have an account? Sign in.")
                            .font(.system(size: 15))
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }.offset(x: 0, y: 0)
                }
            .offset(x: 0, y: 140)
            }.offset(x: 0, y: -210)
            .opacity(self.showingAlert ? 0.4 : 1.0)
            //Custom email verification pop up alert
            VStack(spacing: 20){
            Text("Verify Your Email")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .background(Color.white)
                .foregroundColor(Color.black)
            Image(systemName: "envelope")
                .resizable()
                .frame(width: 25, height: 20)
            Text("We have sent you an email, when done come back here and hit next again!")
                .font(.system(size: 15))
                .fontWeight(.medium)
                .background(Color.white)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
            HStack(){
                Button(action:{
                    withAnimation(){
                    self.showingAlert = false
                    }
                }){
                Text("Ok")
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .background(Color.white)
                    .foregroundColor(blueAccents)
                    }
                }
            }
            .frame(width: 300, height: 225)
            .background(Color.white)
            .cornerRadius(20).shadow(radius: 20)
            .position(x: self.screenWidth / 2, y: showingAlert ? self.screenHeight / 3 : self.screenHeight + 112.5)
            .multilineTextAlignment(.center)
            
            //have not verified
            VStack(spacing: 20){
            Text("Verify Your Email")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .background(Color.white)
                .foregroundColor(Color.black)
            Image(systemName: "envelope")
                .resizable()
                .frame(width: 25, height: 20)
            Text("It looks like you have not verified your email yet, go verify it or send the email again!")
                .font(.system(size: 15))
                .fontWeight(.medium)
                .background(Color.white)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
            HStack(){
                Button(action:{
                    print("Ok pressed")
                    withAnimation(){
                    self.showingAlert2 = false
                    }
                }){
                Text("Ok")
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .background(Color.white)
                    .foregroundColor(blueAccents)
                    }
                Button(action:{
                    print("Resend Email Pressed")
                    print("Resign this alert")
                    
                }){
                   Text("Resend Email")
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .background(Color.white)
                    .foregroundColor(blueAccents)
                    }
                }
            }
            .frame(width: 300, height: 225)
            .background(Color.white)
            .cornerRadius(20).shadow(radius: 20)
            .position(x: self.screenWidth / 2, y: showingAlert2 ? self.screenHeight / 3 : self.screenHeight + 112.5)
            .multilineTextAlignment(.center)

        }.onAppear(){
            print(self.emailGetter.email)
            withAnimation(Animation.easeInOut.delay(0.3)){
                self.linePaddingLeading = true
                
            }
        }
    }
}

extension UIApplication {
    func endEditing_2(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


