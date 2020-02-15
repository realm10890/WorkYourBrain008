//
//  EmailTextField_Rep.swift
//  WorkYourBrain008
//
//  Created by Cesar Almendarez on 2/4/20.
//  Copyright © 2020 Cesar Almendarez. All rights reserved.
//

import SwiftUI

struct EmailTextField_Rep: UIViewRepresentable {
    private let tmpView = EmailTextField_Wrappable()
    var tag: Int = 0
    var placeholder: String?
    var changeHandler: ((String) -> Void)?
    var onCommitHandler: (() -> Void)?
    let seconds = 0.5

    func makeUIView(context: UIViewRepresentableContext<EmailTextField_Rep>) -> EmailTextField_Wrappable{
        tmpView.tag = tag
        tmpView.delegate = tmpView
        tmpView.placeholder = placeholder
        tmpView.onCommitHandler = onCommitHandler
        tmpView.textFieldChangeHandler = changeHandler
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.tmpView.becomeFirstResponder()
        }
        return tmpView
    }
    func updateUIView(_ uiView: EmailTextField_Wrappable, context: UIViewRepresentableContext<EmailTextField_Rep>){
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        uiView.autocorrectionType = .no
    }
}
