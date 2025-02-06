//
//  UITextField+Extension.swift
//  HabuildIt
//
//  Created by vivek on 2024-05-05.
//

import Foundation
import UIKit

extension UITextField {
    
    func setInputViewDatePicker(target: Any , selector : Selector)
    {
        
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        datePicker.datePickerMode = .date
        datePicker.timeZone = TimeZone.current
          if #available(iOS 14, *) {
              datePicker.preferredDatePickerStyle = .wheels
          }
        self.inputView = datePicker
        
        // Create a toolbar and assign it to inputAccessoryView
               let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0)) //4
               let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) //5
               let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel)) // 6
               let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector) //7
               toolBar.setItems([cancel, flexible, barButton], animated: false) //8
               self.inputAccessoryView = toolBar //9
        
       
    }
    @objc func tapCancel()
    {
        self.resignFirstResponder()
    }
}
