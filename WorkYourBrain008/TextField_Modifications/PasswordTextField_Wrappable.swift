//
//  PasswordTextField_Wrappable.swift
//  WorkYourBrain008
//
//  Created by Cesar Almendarez on 2/4/20.
//  Copyright © 2020 Cesar Almendarez. All rights reserved.
//

import Foundation
import UIKit

class PasswordTextField_Wrappable: UITextField, UITextFieldDelegate {
    var textFieldChangeHandler: ((String) -> Void)?
    var onCommitHandler: (() -> Void)?
    var isSecureEntry = true
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        if let nextField = textField.superview?.superview?.viewWithTag(textField.tag + 1) as? UITextField{
            nextField.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
        return false

    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        if let currentValue = textField.text as NSString? {
            let proposedValue =  currentValue.replacingCharacters(in: range, with: string)
            textFieldChangeHandler?(proposedValue as String)
            textField.isSecureTextEntry = isSecureEntry
        }
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        onCommitHandler?()
    }
}
