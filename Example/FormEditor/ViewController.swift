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
    let selectorValues: [(String?, String?)] = [("1","Раз"),("2","Два"),("3","Три")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        form = self
    }
    
    func getSections() -> [FESection] {
        let earlyDate = NSCalendar.current.date(byAdding: .year, value: -10, to: Date())
        
        date1 = Date()
        let section1 = FESection(header: "Хэдер")
        
        section1 += FEDate(id: "DateNew", reuseId: "CustomCell", value: Date(), minDate: earlyDate!, maxDate: Date(), listener: {self.date1 = $0},
       configureCell: {
            let customCell = $0 as! CustomCell
            customCell.titleLabel.text = "Год выпуска"
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy"
            let string = formatter.string(from: self.date1!)
            customCell.valueLabel.text = string
        }, onEndEditing: {
            self.tableView.reloadData()
        })
        
        section1 += FEDate(id: "Date2", title: "Дата", value: Date(), displayableValueFormat: "%@", minDate: earlyDate!, maxDate: Date())
        
        section1 += FEDate(id: "Date3", reuseId: "CustomCell2", value: Date(), minDate: earlyDate!, maxDate: Date(), listener: {self.date2 = $0}, configureCell: {
            let customCell2 = $0 as! CustomCell2
            customCell2.titleTextLabel.text = "Год рождения"
        })

//        section1 += FESelector(id: "sel_1", title: "Выбор 1", value: selector1, readOnly: false, listener: {self.selector1 = $0; self.refresh()}, items: {self.selectorValues})
        
//        for i in 1...2 {
//            section1 += FECustom(id: "Custom\(i)", reuseId: "Cell", onSelect: {print("\(i)")})
//        }
        
        
        let section2 = FESection(footer: "Футер")
        section2 += FEText(id: "text_2", title: "Текст 2", value: value2, visible: (value1?.characters.count ?? 0 > 0)) {self.value2 = $0}
//        section2 += FESelector(id: "sel_2", title: "Выбор 2", value: selector1, readOnly: false, visible: selector1 == "3",listener: {self.selector2 = $0}, items: {self.selectorValues})
        return [section1]//, section2]
    }
    
    @IBAction func switchParamVisibility(_ sender: Any) {
        secondVisible = !secondVisible
        refresh()
    }
}

