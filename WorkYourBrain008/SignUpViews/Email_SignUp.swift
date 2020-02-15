//
//  Email_SignUp.swift
//  WorkYourBrain008
//
//  Created by Cesar Almendarez on 2/4/20.
//  Copyright © 2020 Cesar Almendarez. All rights reserved.
//

import SwiftUI

struct Email_SignUp: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    @State var linePaddingLeading = false
    @State private var email = ""
    @State var nextButtonOpacity = false
    @State var showingAlert = false
    @State private var existingUser_alert = false
    let blueAccents = Color(red: 52.0/255.0, green: 120.0/255.0, blue: 247.0/255.0, opacity: 1.0)
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    VStack(alignment: .leading, spacing: 2){
                        Text("Enter An")
                            .font(.system(size: 35))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Text("Email")
                            .font(.system(size: 35))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Text("Use a currently active email address")
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                        .foregroundColor(blueAccents)
                    }.offset(x: 0, y:0)
                    .padding(.leading)
                    Spacer()
                }
                VStack{
                    EmailTextField_Rep(tag: 0, placeholder: "Email", changeHandler: {(newString) in
                        if(self.isValidEmail(self.email) == true){
                            withAnimation(){
                           // self.buttonDisabled.toggle()
                            self.nextButtonOpacity.toggle()
                            }
                        }else if(self.isValidEmail(self.email) != true){}
                        self.email = newString
                    }, onCommitHandler: {
                        }).disableAutocorrection(true)
                        .frame(width: self.screenWidth - 35, height: 10)
                        .simultaneousGesture(TapGesture().onEnded{
                            if(self.linePaddingLeading == true){
                                return
                            }else if (self.linePaddingLeading != true){
                                withAnimation(){
                                    self.linePaddingLeading.toggle()
                                }
                            }
                        })
                    TextFieldUnderlineView(color: blueAccents)
                        .frame(width: linePaddingLeading ? self.screenWidth - 35 : 0, height: 10)
                    Button(action:{
                        //extended UIApplication Function
                        withAnimation(){
                       self.showingAlert = true
                        self.existingUser_alert = true
                        }
                        if(self.linePaddingLeading == true){
                            self.linePaddingLeading.toggle()
                        }else{}
                        
                    }){
                        Text("Next")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: self.screenWidth - 35, height: 45)
                            .background(blueAccents)
                            .opacity(nextButtonOpacity ? 1.0 : 0.5)
                            .cornerRadius(10)
                            .padding(.bottom)
                    }
                    Button(action:{
                        print("Already Have An Account")
                    }){
                        Text("Already have an account? Sign in.")
                            .font(.system(size: 15))
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                    .offset(x: 0, y: 0)
                }.offset(x: 0, y: 140)
            }.offset(x: 0, y: -210)
            .blur(radius: showingAlert ? 5 : 0, opaque: false)
                VStack(spacing: 20){
                Text("Existing Account")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                Text("It looks like you already have an account with this email")
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .frame(width: 250)
                    HStack(){
                        Button(action:{
                            withAnimation(){
                                self.existingUser_alert = false
                                self.showingAlert = false
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.50){
                                print("Pop to landing screen")
                            }
                        }){
                        Text("Sign In")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .background(Color.white)
                            .foregroundColor(blueAccents)
                    }
                }
            }
        .frame(width: 300, height: 300)
        .background(Color.white)
        .cornerRadius(20).shadow(radius: 20)
                .position(x: self.screenWidth / 2, y: existingUser_alert ? self.screenHeight / 3 : self.screenHeight + 112.5)
        }.onAppear(){
            withAnimation(Animation.easeInOut.delay(0.3)){
                       self.linePaddingLeading.toggle()
                       }
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
    }
}
