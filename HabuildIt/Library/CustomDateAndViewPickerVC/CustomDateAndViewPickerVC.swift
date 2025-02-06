//
//  CustomDateAndViewPickerVC.swift
//  HabuildIt
//
//  Created by Vivek Singh on 02/03/24.
//

import Foundation

import UIKit
enum PickerType {
    case datePickerStart
    case dateDeadlinePicker
    case fromTime
    case toTime
}

protocol PickerDelegate {
    func pickerSelected(value: String, date: Date, type: PickerType)
}

class CustomDateAndViewPickerVC: UIViewController {

    @IBOutlet weak var viewPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var buttonCancel: UIButton!
    @IBOutlet weak var buttonDone: UIButton!
    
    var isEdit : Bool = false
    var delegate: PickerDelegate?
    var currentPickerType: PickerType = .datePickerStart
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch currentPickerType {
        case .datePickerStart:
            setPickerView()
        
        case .dateDeadlinePicker:
            setDeadlinePickerView()
        case .fromTime:
            setFromView()
        case .toTime:
            setToView()
        }
        
        datePicker.backgroundColor = .white
    }
    func setPickerView() {
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        viewPicker.isHidden = true
        datePicker.isHidden = false
        datePicker.datePickerMode = .dateAndTime
//        var components = DateComponents()
//                 //    components.year = -100
//                 let minDate = Calendar.current.date(byAdding: components, to: Date())
//
//                   //  components.year = -18
//                    // components.month = 11
//                 components.day = 8
//                    let maxDate = Calendar.current.date(byAdding: components, to: Date())
//
//                     datePicker.minimumDate = minDate
//                     datePicker.maximumDate = maxDate
        datePicker.date = Date()
//        datePicker.maximumDate = Date()
//        datePicker.minimumDate = Date().getDateForLastYear(years: 100)
        datePicker.minimumDate = Date()
        
    }
    func setDeadlinePickerView() {
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
            viewPicker.isHidden = true
            datePicker.isHidden = false
            datePicker.datePickerMode = .dateAndTime
    //        var components = DateComponents()
    //                 //    components.year = -100
    //                 let minDate = Calendar.current.date(byAdding: components, to: Date())
    //
    //                   //  components.year = -18
    //                    // components.month = 11
    //                 components.day = 8
    //                    let maxDate = Calendar.current.date(byAdding: components, to: Date())
    //
    //                     datePicker.minimumDate = minDate
    //                     datePicker.maximumDate = maxDate
            datePicker.date = Date()
    //        datePicker.maximumDate = Date()
    //        datePicker.minimumDate = Date().getDateForLastYear(years: 100)
            
        datePicker.minimumDate = Date()
       
        
        }
    func setFromView() {
            if #available(iOS 13.4, *) {
                datePicker.preferredDatePickerStyle = .wheels
            }
            viewPicker.isHidden = true
            datePicker.isHidden = false
            datePicker.datePickerMode = .dateAndTime
    //        var components = DateComponents()
    //                 //    components.year = -100
    //                 let minDate = Calendar.current.date(byAdding: components, to: Date())
    //
    //                   //  components.year = -18
    //                    // components.month = 11
    //                 components.day = 8
    //                    let maxDate = Calendar.current.date(byAdding: components, to: Date())
    //
    //                     datePicker.minimumDate = minDate
    //                     datePicker.maximumDate = maxDate
            datePicker.date = Date()
    //        datePicker.maximumDate = Date()
    //        datePicker.minimumDate = Date().getDateForLastYear(years: 100)
            datePicker.minimumDate = Date()
            
        }
    func setToView() {
            if #available(iOS 13.4, *) {
                datePicker.preferredDatePickerStyle = .wheels
            }
            viewPicker.isHidden = true
            datePicker.isHidden = false
            datePicker.datePickerMode = .dateAndTime
    //        var components = DateComponents()
    //                 //    components.year = -100
    //                 let minDate = Calendar.current.date(byAdding: components, to: Date())
    //
    //                   //  components.year = -18
    //                    // components.month = 11
    //                 components.day = 8
    //                    let maxDate = Calendar.current.date(byAdding: components, to: Date())
    //
    //                     datePicker.minimumDate = minDate
    //                     datePicker.maximumDate = maxDate
            datePicker.date = Date()
    //        datePicker.maximumDate = Date()
    //        datePicker.minimumDate = Date().getDateForLastYear(years: 100)
            datePicker.minimumDate = Date()
            
        }
}
