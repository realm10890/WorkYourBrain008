//
//  SchoolCode_SignUp.swift
//  WorkYourBrain008
//
//  Created by Cesar Almendarez on 2/4/20.
//  Copyright © 2020 Cesar Almendarez. All rights reserved.
//

import SwiftUI



struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}


struct SchoolCode_SignUp: View {
   
    @State var str1:String = ""
    @State var str2:String = ""
    @State var str3:String = ""
    @State var str4:String = ""
    @State private var f1Color = false
    @State private var f2Color = false
    @State private var f3Color = false
    @State private var f4Color = false
    let lineWidth:CGFloat = 45
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    //@State var email:String = ""
    @State var str: String = ""
    @State var linePaddingTrailing = true
    @State var linePaddingLeading = false
    let blueAccents = Color(red: 52.0/255.0, green: 120.0/255.0, blue:
    247.0/255.0, opacity: 1.0)
    @State var isNavigationBarHidden: Bool = true
    let appearance = UINavigationBarAppearance()
    @State private var navToggle = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
   
    
    var btnBack: some View {
        Button(action:{
            self.presentationMode.wrappedValue.dismiss()
        }){
            HStack {
            Image("ic_back") // set image here
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                Text("Go back")
            }
        }
    }
    @Binding var rootIsActive: Bool
    
     @EnvironmentObject var emailGetter: emailSetter
    @EnvironmentObject var verify: verificationChecker
    
    var body: some View {
        
       // NavigationView{
        VStack{
            HStack{
                VStack(alignment: .leading, spacing: 2){
                    
                    NavigationLink(destination: Email_SignUp().environmentObject(verify), isActive: $navToggle){
                        EmptyView()
                    }
                    .hidden()
 
                    
                    Text("Enter Your")
                    .font(.system(size: 35))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                  Text("School Code")
                      .font(.system(size: 35))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Button(action:{
                 print("What's My School Code Pressed")
                }){
                Text("What's my school code?")
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .foregroundColor(.blue)
                }
                }.offset(x: 0, y: 150)
                .padding(.leading)
                Spacer()
                }
            VStack(spacing: 0){
                ZStack{
                     HStack {
                         VStack{
                            /*
                            NavigationLink(destination: Email_SignUp(){
                                 EmptyView()
                                 }
                             .isDetailLink(false)
                             .hidden()
                            */
                                 
                             SchoolCodeTextField_Rep(tag: 0, placeholder: "", changeHandler: { (newString) in
                                  self.str1 = newString
                             }, onCommitHandler: {
                             }, changeColorState:{
                             })
                             .font(.custom("Helvetica Neue", size: 35))
                             .multilineTextAlignment(.center)
                             .frame(width: 45, height: 50)
                             .background(Color.white)
                             .padding(.leading)
                             .padding(.trailing)
                             .keyboardType(.numberPad)
                             .offset(x: 0, y: 10)
                             TextFieldUnderlineView(color: f1Color ? .blue : .gray)
                            .frame(width: lineWidth , height: 10)
                             }
                         VStack {
                             SchoolCodeTextField_Rep(tag: 1, placeholder: "", changeHandler: { (newString) in
                                 self.str2 = newString
                             }, onCommitHandler: {
                             }, changeColorState:{
                             })
                             .font(.custom("Helvetica Neue", size: 35))
                             .multilineTextAlignment(.center)
                             .frame(width: 45, height: 50)
                             .background(Color.white)
                             .padding(.leading)
                             .padding(.trailing)
                             .offset(x: 0, y: 10)
                             .keyboardType(.numberPad)
                             TextFieldUnderlineView(color: f2Color ? .blue : .gray)
                             .frame(width:  lineWidth , height: 10)
                         }
                         VStack {
                             SchoolCodeTextField_Rep(tag: 2, placeholder: "", changeHandler: { (newString) in
                                 self.str3 = newString
                             }, onCommitHandler: {
                             }, changeColorState:{
                             })
                             .font(.custom("Helvetica Neue", size: 35))
                             .multilineTextAlignment(.center)
                             .frame(width: 45, height: 50)
                             .background(Color.white)
                             .padding(.leading)
                             .padding(.trailing)
                             .offset(x: 0, y: 10)
                             .keyboardType(.numberPad)
                             TextFieldUnderlineView(color: f3Color ? .blue : .gray)
                             .frame(width: lineWidth , height: 10)
                             }
                         VStack {
                             SchoolCodeTextField_Rep(tag: 3, placeholder: "", changeHandler: { (newString) in
                                 self.str4 = newString
                             }, onCommitHandler: {
                                 print("Check code and go to next page")
                                 self.navToggle.toggle()
                             }, changeColorState: {
                             })
                                 .font(.custom("Helvetica Neue", size: 35))
                                 .multilineTextAlignment(.center)
                                 .frame(width: 45, height: 50)//50
                                 .background(Color.white)
                                 .padding(.leading)
                                 .padding(.trailing)
                                 .offset(x: 0, y: 10)
                                 .keyboardType(.numberPad)
                             TextFieldUnderlineView(color: f4Color ? .blue : .gray)
                             .frame(width: lineWidth, height: 10)
                         }
                     }
                     .frame(width: self.screenWidth, height: 20)
                     .position(x: self.screenWidth / 2, y: self.screenHeight / 2.5)
                    Button(action:{
                        print("Already Have An Account")
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Text("Already have an account? Sign in.")
                        .font(.system(size: 15))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)

                        }
                .offset(x: 0, y: 125)
                }.onDisappear(){
                 self.navToggle.toggle()
                 print("navtoggle = false")
                 }
            }
        }.offset(x: 0, y: -150)
    }
}

