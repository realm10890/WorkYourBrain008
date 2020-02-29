//
//  Username_SignUp.swift
//  WorkYourBrain008
//
//  Created by Cesar Almendarez on 2/4/20.
//  Copyright © 2020 Cesar Almendarez. All rights reserved.
//

import SwiftUI

struct Username_SignUp: View {
    let blueAccents = Color(red: 52.0/255.0, green: 120.0/255.0, blue: 247.0/255.0, opacity: 1.0)
    @State private var username: String = ""
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    @State private var linePaddingLeading = false
    @State private var goToMain = false
    @State private var showExistingUserAlert = false
     @EnvironmentObject var signingIn2: signingInChecker
   // @EnvironmentObject var signingIn2: signingInChecker
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    VStack(alignment: .leading, spacing: 2){
                        Text("What Do You")
                            .font(.system(size: 35))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Text("Want To Be Called")
                            .font(.system(size: 35))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Text("Keep it appropriate, or else!")
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                        .foregroundColor(blueAccents)
                    }.offset(x: 0 , y: 0)
                    .padding(.leading)
                    Spacer()
                }
                VStack{
                    EmailTextField_Rep(tag: 0, placeholder: "Username", changeHandler: {(newString) in
                        self.username = newString
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
                        if(self.username.count >= 5){
                           // self.signingIn2.signingIn == false
                            //self.goToMain = true
                            print("Sign Up Done Go To Main")
                            self.signingIn2.signingIn = false
                        }else  if(self.username.count < 5){
                            withAnimation(){
                            self.showExistingUserAlert = true
                            }
                            print("Username is in use!")
                        }
                       
                        /*
                        if(username != [existingUsernames]){
                            self.goToMain = true
                        }else if(username == [existingUsernames]){
                            self.showExistingUserAlert = true
                        }
                        */
                    }){
                    Text("Finish")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: self.screenWidth - 35, height: 45)
                        .background(blueAccents)
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
            NavigationLink(destination: HomeView(), isActive: $goToMain){
                EmptyView()
            }.hidden()
            
            VStack(spacing: 20){
                    Text("Username Taken")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .background(Color.white)
                        .foregroundColor(Color.black)
                Text("The username \"\(username)\" is already taken by a different account. Try a different one.")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .frame(width: 250)
                        HStack(){
                            Button(action:{
                                withAnimation(){
                                    self.showExistingUserAlert = false
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
            .frame(width: 300, height: 300)
            .background(Color.white)
            .cornerRadius(20).shadow(radius: 20)
            .position(x: self.screenWidth / 2, y: showExistingUserAlert ? self.screenHeight / 3 : self.screenHeight + 112.5)
            
        }.onAppear(){
            withAnimation(Animation.easeInOut.delay(0.3)){
                self.linePaddingLeading = true
            }
        }
    }
}

struct Username_SignUp_Previews: PreviewProvider {
    static var previews: some View {
        Username_SignUp()
    }
}
