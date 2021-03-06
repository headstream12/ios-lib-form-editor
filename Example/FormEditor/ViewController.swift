//
//  ViewController.swift
//  FormEditor
//
//  Created by npu3pak on 07/11/2017.
//  Copyright (c) 2017 npu3pak. All rights reserved.
//

import UIKit
import FormEditor

class ViewController: FormEditorViewController, PFEForm {
    
    var secondVisible = false
    
    var value1: String?
    var value2: String?
    
    var date1: Date?
    var date2: Date?
    
    var selector1: String?
    var selector2: String?
    
    var years: [(value:String?, visibleValue:String?)]? = [
        ("2001", "2001"),
        ("2002", "2002")
    ]
    
    var textNumber: String?
    var textAreaText: String?
    
    let selectorValues: [(String?, String?)] = [("1","Раз"),("2","Два"),("3","Три")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        form = self
    }
    
    func getSections() -> [FESection] {
        let earlyDate = NSCalendar.current.date(byAdding: .year, value: -10, to: Date())
        
        date1 = Date()
        let section1 = FESection(header: "Хэдер")
        
        section1 += FEDate(id: "Date3", reuseId: "CustomDateCell", value: Date(), minDate: earlyDate!, maxDate: Date(), listener: {self.date2 = $0}, configureCell: {
            let customCell2 = $0 as! CustomDateCell
            customCell2.titleTextLabel.text = "Год рождения"
        })
        
        section1 += FESelector(id: "Selector1", reuseId: "CustomSelectorCell", emptyVisibleValue: "Не выбрано", listener: {self.value1 = $0}, items: { [unowned self] in self.years}, configureCell: {
                let selectorCell = $0 as! CustomSelectorCell
                selectorCell.titleTextLabel.text = "Год выпуска"
            })
        
        section1 += FEText(id: "Text", reuseId: "CustomTextCell", keyboardType: .numberPad, maxLength: 4, listener: {self.textNumber = $0}, configureCell: {
            let textCell = $0 as! CustomTextCell
            textCell.titleTextLabel.text = "Мощность двигателя"
        })
        
        
        let section2 = FESection(header: "Описание")
        section2 += FETextArea(id: "TextArea", title: "Добавьте описание", listener: {self.textAreaText = $0})

        return [section1, section2]
    }
    
    @IBAction func switchParamVisibility(_ sender: Any) {
        secondVisible = !secondVisible
        refresh()
    }
}

