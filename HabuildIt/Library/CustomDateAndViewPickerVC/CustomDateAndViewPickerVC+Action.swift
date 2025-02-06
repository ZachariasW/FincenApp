//
//  CustomDateAndViewPickerVC+Action.swift
//  HabuildIt
//
//  Created by Vivek Singh on 02/03/24.
//

import Foundation
import UIKit

extension CustomDateAndViewPickerVC {
    
    @IBAction func buttonActionCancel(_ sender: UIButton) {
        print("buttonActionCancel")
dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func buttonActionDone(_ sender: UIButton) {
           print("buttonActionDone")
           switch currentPickerType {
           case .datePickerStart:
               let formattor = DateFormatter()
               formattor.dateFormat = "MM-dd-yyyy"
               let displayDate = formattor.string(from: datePicker.date)
               delegate?.pickerSelected(value: displayDate, date: datePicker.date, type: currentPickerType)
           case .dateDeadlinePicker:
               let formattor = DateFormatter()
               formattor.dateFormat = "MM-dd-yyyy"
               let displayDate = formattor.string(from: datePicker.date)
               delegate?.pickerSelected(value: displayDate, date: datePicker.date, type: currentPickerType)
               case .fromTime:
                 let formattor = DateFormatter()
                              formattor.dateFormat = "HH-MM"
                              let displayDate = formattor.string(from: datePicker.date)
                              delegate?.pickerSelected(value: displayDate, date: datePicker.date, type: currentPickerType)
               case .toTime:
                let formattor = DateFormatter()
                formattor.dateFormat = "HH-MM"
                let displayDate = formattor.string(from: datePicker.date)
                delegate?.pickerSelected(value: displayDate, date: datePicker.date, type: currentPickerType)
        break
                        
        }
           dismiss(animated: true, completion: nil)
       }
}
