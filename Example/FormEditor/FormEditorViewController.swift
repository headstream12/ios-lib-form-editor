//
//  FormEditorViewController.swift
//  FormEditor_Example
//
//  Created by Evgeniy Safronov on 12.10.17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import FormEditor

@objc public class FormEditorViewController: FEViewController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        preferences.colors.inputAccessory.background = view.backgroundColor!
        preferences.colors.inputAccessory.done = UIColor.red
        preferences.colors.inputAccessory.navigation = view.backgroundColor!
        preferences.colors.text.editing = UIColor.darkGray
        preferences.colors.text.normal = UIColor.orange
        preferences.colors.text.placeholder = UIColor.black
        
        preferences.labels.inputAccessory.done = "Готово"
    }
}
