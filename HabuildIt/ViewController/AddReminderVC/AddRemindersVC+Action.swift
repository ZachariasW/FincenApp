//
//  AddRemindersVC+Action.swift
//  HabuildIt
//
//  Created by Vivek Singh on 06/03/24.
//

import Foundation

import UIKit

extension AddRemindersVC {
    
    //MARK:-----------[ACTIONS]------------
    
    @IBAction func buttonActionBack(_ sender: UIButton){
        Console.log("buttonActionBack")
        popViewController()
    }
  
    @IBAction func buttonActionSave(_ sender: UIButton){
        Console.log("buttonActionSave")
      
        if validate() {
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            scheduleRepeatingNotification(everyNDays: Int(textFieldReminderDate.text ?? "1") ?? 1)
            textFieldReminderDate.resignFirstResponder()
            Constants.userDefaults.setReminder(days: textFieldReminderDate.text ?? "25")
            checkReminder()
        }
            
    }
   
    func validate()->Bool {
        if textFieldReminderDate.text?.isEmpty ?? false
            
        {
            DisplayBanner.infoBanner(message: "Please enter no of days between 10-30")
            return false
        }
        else if (Int(textFieldReminderDate.text ?? "0") ?? 0  > 30) ||  (Int(textFieldReminderDate.text ?? "0") ?? 0 < 1)
                    
        {
            DisplayBanner.infoBanner(message: "Please enter no of days between 10-30")
            return false
        }
        
        return true
    }
    
    func scheduleRepeatingNotification(everyNDays days: Int) {
        guard days > 0 else {
            print("Invalid number of days. Must be greater than 0.")
            return
        }

        // Create the notification content
        let content = UNMutableNotificationContent()
        content.title = "HabuildIt"
        content.body = "Notification Reminder! Please send notice to all beneficiaries."

        let currentDate = Date()
        let calendar = Calendar.current

        // Get the start date (10:00 AM today or the next 10:00 AM in `n` days)
        guard let startDate = calendar.date(bySettingHour: 10, minute: 0, second: 0, of: currentDate) else {
            print("Failed to calculate start date.")
            return
        }

        // Adjust start date if it has already passed today
        let adjustedStartDate = startDate > currentDate ? startDate : calendar.date(byAdding: .day, value: days, to: startDate)!

        // Determine the scheduling range based on `days`
        let maxDays = days < 7 ? 60 : 365 // 2 months for <7 days, else 1 year

        // Schedule notifications for the determined range
        for dayOffset in stride(from: 0, to: maxDays, by: days) {
            if let nextDate = calendar.date(byAdding: .day, value: dayOffset, to: adjustedStartDate) {
                // Skip past dates
                if nextDate <= currentDate { continue }

                let triggerDateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: nextDate)
                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDateComponents, repeats: false)

                // Create a unique identifier for each notification
                let requestIdentifier = "HabuildIt_\(dayOffset)"

                // Create the request
                let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)

                // Schedule the notification
                UNUserNotificationCenter.current().add(request) { error in
                    if let error = error {
                        print("Error scheduling notification: \(error.localizedDescription)")
                    } else if dayOffset == 0 {
                        // Display the banner for the first notification only
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "EEEE, MMM d, yyyy 'at' h:mm a"
                        let nextScheduleDateString = dateFormatter.string(from: nextDate)

                        DisplayBanner.successBanner(message: "Next notification scheduled for \(nextScheduleDateString).")
                    }
                }
            }
        }
    }


}

