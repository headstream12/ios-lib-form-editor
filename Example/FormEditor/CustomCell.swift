//
//  CustomCell.swift
//  FormEditor_Example
//
//  Created by Ilya Glazunov on 06/11/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import FormEditor

class CustomCell: FEDateCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    public override func textFieldDidBeginEditing(_ textField: UITextField) {
        if let editingTextColor = facade?.preferences.colors.text.editing {
            valueLabel.textColor = editingTextColor
        }
        super.textFieldDidBeginEditing(textField)
    }
    
    public override func textFieldDidEndEditing(_ textField: UITextField) {
        if let normal = facade?.preferences.colors.text.normal {
            valueLabel.textColor = normal
        }
        super.textFieldDidEndEditing(textField)
    }
    
}
