//
//  PasswordTextField_Rep.swift
//  WorkYourBrain008
//
//  Created by Cesar Almendarez on 2/4/20.
//  Copyright © 2020 Cesar Almendarez. All rights reserved.
//

import SwiftUI

struct PasswordTextField_Rep: UIViewRepresentable {
    private let tmpView = PasswordTextField_Wrappable()
    var tag: Int = 0
    var placeholder: String?
    var changeHandler: ((String) -> Void)?
    var onCommitHandler: (() -> Void)?
    let seconds = 0.5
    
    func makeUIView(context: UIViewRepresentableContext<PasswordTextField_Rep>) -> PasswordTextField_Wrappable{
        tmpView.tag = tag
        tmpView.delegate = tmpView
        tmpView.placeholder = placeholder
        tmpView.onCommitHandler = onCommitHandler
        tmpView.textFieldChangeHandler = changeHandler
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds){
            self.tmpView.becomeFirstResponder()
        }
        return tmpView
    }
    func updateUIView(_ uiView: PasswordTextField_Wrappable, context: UIViewRepresentableContext<PasswordTextField_Rep>){
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        uiView.autocorrectionType = .no
    }
}
