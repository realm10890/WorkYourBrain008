//
//  SchoolCodeTextField_Rep.swift
//  WorkYourBrain008
//
//  Created by Cesar Almendarez on 2/4/20.
//  Copyright © 2020 Cesar Almendarez. All rights reserved.
//

import Foundation
import SwiftUI

struct SchoolCodeTextField_Rep: UIViewRepresentable {
    private let tmpView = SchoolCodeTextField_Wrappable()
     var tag: Int = 0
     var placeholder: String?
     var changeHandler: ((String) -> Void)?
     var onCommitHandler: (() -> Void)?
    var changeColorState: (() -> Void)?
    var activeTextField = UITextField()
    let seconds = 0.0

     func makeUIView(context: UIViewRepresentableContext<SchoolCodeTextField_Rep>) -> SchoolCodeTextField_Wrappable{
         tmpView.tag = tag
         tmpView.delegate = tmpView
         tmpView.placeholder = placeholder
         tmpView.onCommitHandler = onCommitHandler
         tmpView.changeColorState = changeColorState
         tmpView.textFieldChangeHandler = changeHandler
         tmpView.textAlignment = .center
         tmpView.font = .boldSystemFont(ofSize: 35)
         tmpView.keyboardType = UIKeyboardType.numberPad
        if tmpView.tag == 0{
            tmpView.becomeFirstResponder()
        }
         return tmpView
     }
     func updateUIView(_ uiView: SchoolCodeTextField_Wrappable, context: UIViewRepresentableContext<SchoolCodeTextField_Rep>){
         uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
         uiView.setContentHuggingPriority(.defaultLow, for: .horizontal)
         uiView.autocorrectionType = .no
     }
}
