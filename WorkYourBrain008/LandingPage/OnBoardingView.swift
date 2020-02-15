//
//  OnBoardingView.swift
//  WorkYourBrain008
//
//  Created by Cesar Almendarez on 2/4/20.
//  Copyright © 2020 Cesar Almendarez. All rights reserved.
//

import SwiftUI
import UIKit

struct OnBoardingView: View {
    //@ObservedObject var navToSignIn: NavToSignIn
    //@ObservedObject var dataRouter2: SignInDataRouter
    //@ObservedObject var viewRouter: ViewRouter
    @State private var isGetStartedButton = false
    //@ObservedObject var activity: activityOfNavLink
    let blueAccents = Color(red: 52.0/255.0, green: 120.0/255.0, blue:
      247.0/255.0, opacity: 1.0)
    @State var isActivubdf = false
    @State var curAct = false
    @State var rootState  = false
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var subViews = [
        UIHostingController(rootView: OnBoardingView_Subviews(imageString: "")),
        UIHostingController(rootView: OnBoardingView_Subviews(imageString: "")),
        UIHostingController(rootView: OnBoardingView_Subviews(imageString: ""))
                ]
   // var emailHandlingViews = [EmailVerificationHandle(), ]
    var titles = ["Have a question? Ask it.", "Conquer personal hindrances", "Create a peaceful mind"]
    var captions =  ["Post your question and work with your peers to find a solution.", "Meditating helps you dealing with anxiety and other psychic problems", "Regular medidation sessions creates a peaceful inner mind"]
    
    var buttonText = ["Next", "Next", "Get Started"]
    @State var currentPageIndex = 0
    /*
    func settingFinalState() -> Bool{
        var finalDes = false
        if self.activity.isActive == true{
            finalDes = true
            
        }else if self.activity.isActive == false{
            finalDes = false
        }
        return finalDes
    }
 */
    @State var isActive: Bool = false
    
    var body: some View {
    NavigationView{
VStack(alignment: .leading) {
    /*
            NavigationLink(destination: Email_SignIn(/*activity: activityOfNavLink(), viewRouter: ViewRouter(), dataRouter: DataRouter()*/), isActive: self.$curAct) {
             EmptyView()
           }.hidden()
 */
            PageViewController_Rep(currentPageIndex: $currentPageIndex, viewControllers: subViews)
            .frame(height: 400)
          Group {
            Text(titles[currentPageIndex])
                .font(.system(size: 22))
                .fontWeight(.semibold)
                .foregroundColor(.black)
            Text(captions[currentPageIndex])
                .font(.system(size: 12))
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .frame(width: 300, height: 50, alignment: .leading)
                .lineLimit(nil)
            }.padding(.leading)
        HStack {
            PageControl_Rep(numberOfPages: subViews.count, currentPageIndex: $currentPageIndex)
            Spacer()
            if currentPageIndex == 0{
                Button(action:{
                    print("Go To Next Slide View")
                    if self.currentPageIndex+1 == self.subViews.count {
                    self.currentPageIndex = 0
                    }else {
                        self.currentPageIndex += 1
                    }
                }){
                    Text("Next")
                    .font(.system(size: 12))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 150 , height: 45)
                    .background(blueAccents)
                    .cornerRadius(10)
                    }
            }else if currentPageIndex == 1{
               Button(action:{
                   print("Go To Next Slide View")
                if self.currentPageIndex+1 == self.subViews.count {
                   self.currentPageIndex = 0
                    }else {
                    self.currentPageIndex += 1
                    }
               }){
                   Text("Next")
                   .font(.system(size: 12))
                   .fontWeight(.semibold)
                   .foregroundColor(.white)
                   .frame(width: 150 , height: 45)
                   .background(blueAccents)
                   .cornerRadius(10)
                   }
            }else if currentPageIndex == 2 {
                
                NavigationLink(destination: SchoolCode_SignUp(/*viewRouter: ViewRouter(), dataRouter: DataRouter(),navToSignIn: NavToSignIn(),*/ rootIsActive: self.$isActive), isActive: self.$isActive
                    ){
                        Text("Get Started")
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 150 , height: 45)
                        .background(blueAccents)
                        .cornerRadius(10)
                }
                .isDetailLink(false)
                
            }
        }
                    .padding(.leading)
                    .padding(.trailing)
            }
        .onAppear(){
           // self.curAct = true
            //print("----------\(self.navToSignIn.switchingState)-------------")
            /*
            //print("-----------\(self.curAct)--------------------")
            print("-----------------" + self.navToSignIn.switchingState + "----------------------")
            //print("navigate to sign in email")
            
            if(self.navToSignIn.switchingState == "OnBoaringView"){
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0){
                self.curAct = true
                
                print("Navigating To Email Sign Up")
                }
            } else if(self.navToSignIn.switchingState == "NotOnBoarding"){
                print("Not Navigating To Email Sign Up")
                print("-----------\(self.curAct)--------------------")
                
            }
 */
        }
        .navigationBarItems(trailing:
            NavigationLink(destination: Email_SignIn(/*activity: activityOfNavLink(), viewRouter: ViewRouter(), dataRouter: DataRouter()*/)){
                Text("Sign In")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            })
        }
    }
}
struct activeView: View {
    var body : some View{
        Text("active")
           
    }
}

struct inactiveView: View {
    var body : some View{
        Text("inactive")
    }
}
struct NextButton1: View {
    let blueAccents = Color(red: 52.0/255.0, green: 120.0/255.0, blue:
      247.0/255.0, opacity: 1.0)
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var body: some View{
        Button(action:{
            print("Go To Next Slide View")
        }){
            Text("Next")
            .font(.system(size: 12))
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 150 , height: 45)
            .background(blueAccents)
            .cornerRadius(10)
            }
        }
    }
struct NextButton2: View {
let blueAccents = Color(red: 52.0/255.0, green: 120.0/255.0, blue:
  247.0/255.0, opacity: 1.0)
let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height
var body: some View{
    Button(action:{
        print("Go To Next Slide View")
    }){
        Text("Next")
        .font(.system(size: 12))
        .fontWeight(.semibold)
        .foregroundColor(.white)
        .frame(width: 150 , height: 45)
        .background(blueAccents)
        .cornerRadius(10)
        }
    }
}

struct ButtonContent2: View {
    let blueAccents = Color(red: 52.0/255.0, green: 120.0/255.0, blue:
      247.0/255.0, opacity: 1.0)
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var body: some View{
        Text("Get Started")
            .font(.system(size: 12))
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 150 , height: 45)
            .background(blueAccents)
            .cornerRadius(10)
    }
}
