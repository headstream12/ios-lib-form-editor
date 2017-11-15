//
//  FormEditorViewController.swift
//  FormEditor_Example
//
//  Created by Evgeniy Safronov on 12.10.17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import FormEditor

class FormEditorViewController: FEViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preferences.colors.inputAccessory.background = view.backgroundColor!
        preferences.colors.inputAccessory.done = UIColor.red
        preferences.colors.inputAccessory.navigation = view.backgroundColor!
        preferences.colors.text.editing = UIColor.red
        preferences.colors.text.normal = UIColor.orange
    }
}
