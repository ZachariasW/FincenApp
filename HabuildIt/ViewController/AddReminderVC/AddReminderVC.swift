//
//  AddReminderVC.swift
//  HabuildIt
//
//  Created by Vivek Singh on 02/03/24.
//

import UIKit
import UserNotifications

class AddRemindersVC: UIViewController, UITextFieldDelegate  {
    
    @IBOutlet weak var textFieldReminderDate: UITextField!
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var labelReminder: UILabel!
    @IBOutlet weak var labelNextReminder: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSave.makeRoundCorner(5)
        textFieldReminderDate.delegate = self
        textFieldReminderDate.keyboardType = .numberPad
        checkReminder()
        fetchPendingNotifications(label: labelNextReminder)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewWillLayoutSubviews() {
        self.buttonSave.applyGradient(colors: [Constants.Color.appbuttonGradiantStart.cgColor, Constants.Color.appbuttonGradiantEnd.cgColor])
       
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textFieldReminderDate.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: text)
        return updatedText.count <= 2
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == textFieldReminderDate {
            let currentText = textFieldReminderDate.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            return updatedText.count <= 2
        }
        else {
            return true
        }
    }
    
    func checkReminder() {
        if kUserDefaults.getReminder().isEmpty
        {
            textFieldReminderDate.text = "25"
        }
        else
        {
            textFieldReminderDate.text = kUserDefaults.getReminder()
        }
        if Int(textFieldReminderDate.text ?? "25") ?? 0 > 1
        {
            labelReminder.text = "Notifications every \(textFieldReminderDate.text ?? "") days"
        }
        else
        {
            labelReminder.text = "Notifications every \(textFieldReminderDate.text ?? "") day"
        }
       
    }
    
    func fetchPendingNotifications(label: UILabel) {
        let notificationCenter = UNUserNotificationCenter.current()
        
        notificationCenter.getPendingNotificationRequests { requests in
            print("Total Pending Notifications: \(requests.count)")
            
            // Track the earliest next trigger date
            var nextScheduledDate: Date?
            
            for request in requests {
                print("Notification Identifier: \(request.identifier)")
                print("Title: \(request.content.title)")
                print("Body: \(request.content.body)")
                
                if let trigger = request.trigger as? UNCalendarNotificationTrigger {
                    if let triggerDate = trigger.nextTriggerDate() {
                        print("Trigger Date: \(triggerDate)")
                        
                        // Update the nextScheduledDate to the earliest date
                        if nextScheduledDate == nil || triggerDate < nextScheduledDate! {
                            nextScheduledDate = triggerDate
                        }
                    }
                } else if let trigger = request.trigger as? UNTimeIntervalNotificationTrigger {
                    print("Trigger Time Interval: \(trigger.timeInterval)")
                } else if let trigger = request.trigger as? UNLocationNotificationTrigger {
                    print("Trigger Location: \(String(describing: trigger.debugDescription))")
                }
            }
            
            // Update the label on the main thread
            DispatchQueue.main.async {
                if let nextScheduledDate = nextScheduledDate {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "EEEE, MMM d, yyyy 'at' h:mm a"
                    let formattedDate = dateFormatter.string(from: nextScheduledDate)
                    label.text = "Next Notification: \(formattedDate)"
                } else {
                    label.text = "No notifications scheduled."
                }
            }
        }
    }

}
