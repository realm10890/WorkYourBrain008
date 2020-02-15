//
//  SchoolCodeTextField_Wrappable.swift
//  WorkYourBrain008
//
//  Created by Cesar Almendarez on 2/4/20.
//  Copyright © 2020 Cesar Almendarez. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine


class SchoolCodeTextField_Wrappable: UITextField, UITextFieldDelegate {
    var textFieldChangeHandler: ((String) -> Void)?
    var onCommitHandler: (() -> Void)?
    var changeColorState: (() -> Void)?
    var isSecureEntry = false
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        if let nextField = textField.superview?.superview?.viewWithTag(textField.tag + 1) as? UITextField{
            nextField.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 1
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        onCommitHandler?()
    }
    
    @objc func textChanged(sender: UITextField) {
        if (sender.text?.count)! > 0 {
            if let nextField = sender.superview?.superview?.viewWithTag(sender.tag + 1) as? UITextField{
                nextField.becomeFirstResponder()
            }else{
                sender.resignFirstResponder()
            }
        }
    }
}
