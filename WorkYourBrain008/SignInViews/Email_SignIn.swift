//
//  Email_SignIn.swift
//  WorkYourBrain008
//
//  Created by Cesar Almendarez on 2/4/20.
//  Copyright © 2020 Cesar Almendarez. All rights reserved.
//

import SwiftUI
import Firebase

struct Email_SignIn: View {
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    @State private var email = ""
    @State private var password = ""
    @State private var linePaddingLeading = false
    @State private var nextButtonOpacity = false
    @State private var nextButtonDisabled = true
    @State private var goToPassword = false
    @State private var noAccountFound_alert = false
    
    @EnvironmentObject var signInEmailGetter: signInEmailSetter
    
    let blueAccents = Color(red: 52.0/255.0, green: 120.0/255.0, blue: 247.0/255.0)
    func isValidEmail2(_ email: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MACTHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    VStack(alignment: .leading, spacing: 2){
                        Text("Sign In With")
                            .font(.system(size: 35))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Text("Your Email")
                            .font(.system(size: 35))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Text("Sign in with the email you used to sign up.")
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                        .foregroundColor(blueAccents)
                    }.offset(x: 0, y: 0)
                        .padding(.leading)
                    Spacer()
                }
                VStack{
                   // TextField("Email", text: $emailGetter.email)
                    EmailTextField_Rep(tag: 0, placeholder: "Email", changeHandler: {(newString) in
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
                         UIApplication.shared.endEditing_3()
                        //check if email exists
                        //UIApplication.shared.endEditing_3()
                        Auth.auth().fetchSignInMethods(forEmail: self.email, completion: {
                            (provider, error) in
                            if(provider != nil){
                                self.signInEmailGetter.signInEmail = self.email
                                self.goToPassword = true
                            }else {
                                withAnimation(){
                                    self.noAccountFound_alert = true
                                }
                            }
                        })
                    }){
                        Text("Next")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: self.screenWidth - 35, height: 45)
                            .background(blueAccents)
                            //.opacity(nextButtonOpacity ? 1.0 : 0.5)
                            .cornerRadius(10)
                            .padding(.bottom)
                    }//.disabled(self.nextButtonDisabled)
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
                .blur(radius: noAccountFound_alert ? 5 : 0, opaque: false)
            VStack(spacing: 20){
                Text("No Account Found")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                Text("It looks like there is no account with this email")
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .frame(width: 250)
                HStack(){
                    Button(action:{
                        withAnimation(){
                          //  self.noAccountFound_alert = false
                            self.noAccountFound_alert = false
                        }
                    }){
                        Text("Sign Up")
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
            .position(x: self.screenWidth / 2, y: noAccountFound_alert ? self.screenHeight / 3 : self.screenHeight + 112.5)
            NavigationLink(destination: Password_SignIn(), isActive: $goToPassword){
                EmptyView()
            }.hidden()
 
        }
        .onAppear(){
            withAnimation(Animation.easeInOut.delay(0.3)){
                self.linePaddingLeading = true
            }
        }
        
        .onDisappear(){
           withAnimation(Animation.easeInOut.delay(0.3)){
                self.linePaddingLeading = false
                }
            }
        }
    }
extension UIApplication {
    func endEditing_3() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
    }
}
