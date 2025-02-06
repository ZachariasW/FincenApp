//
//  UserDefaults+Addition.swift
//  HabuildIt
//
//  Created by Vivek Singh on 07/11/23.
//

import Foundation
extension UserDefaults {
    
    func isUserLogin() -> Bool {
        return bool(forKey: UserDefaultKeys.kIsLoggedIn)
    }
        
    func isUserVerified() -> Bool {
        return (String.getString(string(forKey: UserDefaultKeys.kIsVerified)) == "1" ? true : false)
    }
    
    func getUserId() -> String {
        return String.getString(string(forKey: UserDefaultKeys.kUserId))
    }
    
    func getApiName() -> String {
        return String.getString(string(forKey: UserDefaultKeys.api))
    }
    
    func getUserBio() -> String {
        return String.getString(string(forKey: UserDefaultKeys.kBio))
    }
   
    func getNotificationStatus() -> Bool {
        return bool(forKey: UserDefaultKeys.kNotificationStatus)
    }
    
    func getKtutorial() -> Bool {
        return bool(forKey: UserDefaultKeys.kTutorial)
    }
    func getKtutorial1() -> Bool {
        return bool(forKey: UserDefaultKeys.kTutorial1)
    }
    func getKtutorial2() -> Bool {
        return bool(forKey: UserDefaultKeys.kTutorial2)
    }
    func getKtutorial3() -> Bool {
        return bool(forKey: UserDefaultKeys.kTutorial3)
    }
    
    func getKtutorial4() -> Bool {
        return bool(forKey: UserDefaultKeys.kTutorial4)
    }
    
    func setKtutorial(kTutorial: Bool) {
        self.set(kTutorial, forKey: UserDefaultKeys.kTutorial)
        self.synchronize()
    }

    func setKtutorial1(kTutorial: Bool) {
        self.set(kTutorial, forKey: UserDefaultKeys.kTutorial1)
        self.synchronize()
    }
    func setKtutorial2(kTutorial: Bool) {
        self.set(kTutorial, forKey: UserDefaultKeys.kTutorial2)
        self.synchronize()
    }
    func setKtutorial3(kTutorial: Bool) {
        self.set(kTutorial, forKey: UserDefaultKeys.kTutorial3)
        self.synchronize()
    }
    func setKtutorial4(kTutorial: Bool) {
        self.set(kTutorial, forKey: UserDefaultKeys.kTutorial4)
        self.synchronize()
    }
    
    func setOpt(opt: Bool) {
        self.set(opt, forKey: UserDefaultKeys.kopt)
        self.synchronize()
    }
    
    func getOpt() -> Bool {
        return bool(forKey: UserDefaultKeys.kopt)
    }
    
    func setReminder(days: String) {
        self.set(days, forKey: UserDefaultKeys.kReminder)
        self.synchronize()
    }
    
    func getReminder() -> String {
        return String.getString(string(forKey: UserDefaultKeys.kReminder))
    }
    
    func setDeviceToken(deviceToken: String) {
        self.set(deviceToken, forKey: UserDefaultKeys.kDeviceToken)
        self.synchronize()
    }
    
    func getDeviceToken() -> String {
        return String.getString(string(forKey: UserDefaultKeys.kDeviceToken))
    }
    
    func getFacebookId() -> String {
        return String.getString(string(forKey: UserDefaultKeys.kFacebookId))
    }
    
    func getUserName() -> String {
        return String.getString(string(forKey: UserDefaultKeys.kUsername))
    }
    
    func setUserName(userName: String) {
        self.set(userName, forKey: UserDefaultKeys.kUsername)
        self.synchronize()
    }
    
    func getUserPassword() -> String {
        return String.getString(string(forKey: UserDefaultKeys.kPassword))
    }

    func getUserEmail() -> String {
        return String.getString(string(forKey: UserDefaultKeys.kLoggedInEmail))
    }
    
    func getNumberOfCircle() -> String {
        return String.getString(string(forKey: UserDefaultKeys.kNo_of_circle))
    }
    
    func getUserProfileImage() -> String {
        return String.getString(string(forKey: UserDefaultKeys.kProfileImage))
    }
    
    func getUserPhoneNumber() -> String {
        return String.getString(string(forKey: UserDefaultKeys.kPhoneNumber))
    }
    
    func setUserPhoneNumber(contact: String) {
        self.set(contact, forKey: UserDefaultKeys.kPhoneNumber)
        self.synchronize()
    }
   
}
