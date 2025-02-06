//
//  String+Extensions.swift
//  WeekInChina
//
//  Created by Kanika Mishra on 13/03/19.
//  Copyright © 2019 MobileCoderz. All rights reserved.
//

import UIKit
extension String
{
    
    func isPasswordValid() -> Bool{
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: self)
    }
    func isValidEmail() -> Bool { //  "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    func isValidName() -> Bool {
        let nameRegEx = "[A-Za-z]+(\\s[A-Za-z]+)?"
        //"[a-zA-Z'-. ]+"
        
        //"^[a-zA-Z\\s]*$]"
        
        let nameTest = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
        return nameTest.evaluate(with: self)
    }
    
    
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
    func trailingTrim(_ characterSet : CharacterSet) -> String {
        if let range = rangeOfCharacter(from: characterSet, options: [.anchored, .backwards]) {
            return self.substring(to: range.lowerBound).trailingTrim(characterSet)
        }
        return self
    }
    func trimFromLeading() -> String
    {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    var boolValue: Bool {
        return NSString(string: self).boolValue
    }
    
    func isPasswordSame(_ confirmPassword : String) -> Bool {
        if confirmPassword == self{
            return true
        }else{
            return false
        }
    }
    
    func isLengthValid(_ length : Int) -> Bool {
        if self.count == length{
            return true
        }else{
            return false
        }
    }
    
    func isLengthValid(minLength: Int , maxLength: Int) -> Bool {
        return self.count >= minLength && self.count <= maxLength
    }
    func isNumeric() -> Bool{
        return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self))
    }
    func isAllDigitsZero() -> Bool{
        if let validValue = Int(self){
            if validValue == 0{
                return true
            }
        }
        return false
    }
    func isMinimumLengthValid(minLength : Int) -> Bool {
        return self.count >= minLength
    }
    func isMaximumLengthValid(maxLength : Int) -> Bool  {
        return self.count <= maxLength
    }
    func isValidPassword() -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: self)
    }
    func isAlphabet() -> Bool {
        return CharacterSet.letters.isSuperset(of: CharacterSet(charactersIn: self))
    }
    static func basicAuth(userName : String , password : String) -> String{
        let authString = String(format: "%@:%@", userName, password)
        let authStringData = authString.data(using: String.Encoding.utf8)!
        let base64EncodedCredential = authStringData.base64EncodedString()
        let basicAuthString = "Basic \(base64EncodedCredential)"
        return basicAuthString
    }
    
    func isNameValid() -> String? {
        if self == "" {
            
            return Validation.errorFirstNameEmpty
        }else if !self.isValidName() {
            return Validation.errorNameInvalid
        }else if !self.isLengthValid(minLength: 3, maxLength: 10) {
            return Validation.errorNameLength
        }
        return nil
    }
    
    func isPhoneNumberValid() -> String?{
        let value = self
        if value.isEmpty {
            return Validation.errorEmptyPhoneNumber
        }
        else if !value.isNumeric() {
            return Validation.errorNotNumeric
            
        }else if !value.isLengthValid(minLength: 8, maxLength: 15){
            return Validation.errorPhoneLength
        }
        return nil
        
    }
    
    func isEmailValid() -> String?{
        let value = self
        if value == "" {
            return Validation.errorEmailEmpty
        }
        else if !value.isValidEmail() {
            return  Validation.errorEmailInvalid
            
        }
        return nil
        
    }
    
    func isAlphanumeric() -> Bool {
        return self.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil && self != ""
    }
    func validateEmail(){
        
    }
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    
    
    static func getString(_ message: Any?) -> String {
        if let string = message {
            guard let strMessage = string as? String else {
                guard let doubleValue = string as? Double else {
                    guard let intValue = string as? Int else {
                        guard string is Float else {
                            guard let int64Value = string as? Int64 else {
                                guard let int32Value = string as? Int32 else {
                                    guard let int16Value = string as? Int32 else {
                                        return ""
                                    }
                                    return String(int16Value)
                                }
                                return String(int32Value)
                            }
                            return String(int64Value)
                        }
                        return String(format: "%.2f", string as! Float)
                    }
                    return String(intValue)
                }
                let formatter = NumberFormatter()
                formatter.minimumFractionDigits = 0
                formatter.maximumFractionDigits = 2
                formatter.minimumIntegerDigits = 1
                guard let formattedNumber = formatter.string(from: NSNumber(value: doubleValue)) else {
                    return ""
                }
                return formattedNumber
            }
            return strMessage
        }
        return ""
    }
    
    
    func isContactNumberValid() -> Bool {
        if(self.count >= 8 && self.count <= 16) {
            return true
        }
        else {
            return false
        }
    }
    
    
    func findMentionText() -> [String] {
        var arr_hasStrings:[String] = []
        let regex = try? NSRegularExpression(pattern: "(#[a-zA-Z0-9_\\p{Arabic}\\p{N}]*)", options: [])
        if let matches = regex?.matches(in: self, options:[], range:NSMakeRange(0, self.count)) {
            for match in matches {
                arr_hasStrings.append(NSString(string: self).substring(with: NSRange(location:match.range.location, length: match.range.length )))
            }
        }
        return arr_hasStrings
    }
    
    func convert(_ hashElements:[String], string: String) -> NSAttributedString {

        let hasAttribute = [NSAttributedString.Key.foregroundColor: UIColor.orange]

        let normalAttribute = [NSAttributedString.Key.foregroundColor: UIColor.black]

        let mainAttributedString = NSMutableAttributedString(string: string, attributes: normalAttribute)

        let txtViewReviewText = string as NSString

        hashElements.forEach { if string.contains($0) {
            mainAttributedString.addAttributes(hasAttribute, range: txtViewReviewText.range(of: $0))
            }
        }
        return mainAttributedString
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func trim(to maximumCharacters: Int) -> String {
           return "\(self[..<index(startIndex, offsetBy: maximumCharacters)])" + "..."
       }
    
   

        var stripped: String {
            let okayChars = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-=()!_")
            return self.filter {okayChars.contains($0) }
        }
    
    
    func onlyNumbers() -> [NSNumber] {
           let formatter = NumberFormatter()
           formatter.numberStyle = .decimal
           let charset = CharacterSet.init(charactersIn: " ,")
           return matches(for: "[+-]?([0-9]+([., ][0-9]*)*|[.][0-9]+)").compactMap { string in
               return formatter.number(from: string.trimmingCharacters(in: charset))
           }
       }

       // https://stackoverflow.com/a/54900097/4488252
       func matches(for regex: String) -> [String] {
           guard let regex = try? NSRegularExpression(pattern: regex, options: [.caseInsensitive]) else { return [] }
           let matches  = regex.matches(in: self, options: [], range: NSMakeRange(0, self.count))
           return matches.compactMap { match in
               guard let range = Range(match.range, in: self) else { return nil }
               return String(self[range])
           }
       }
    
    
    func formatDateString() -> String? {
            let dateFormatter = DateFormatter()
            
            // Set the locale and time zone
            
            
            // Set the input format
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            // Convert the input date string to a Date object
            guard let date = dateFormatter.date(from: self) else {
                return ""
            }
            
            // Set the output format
            dateFormatter.dateFormat = "MMM dd, yyyy"
            
            // Convert the Date object to the output date string
            return dateFormatter.string(from: date)
        }
    
    func trimmed() -> String {
            return self.trimmingCharacters(in: .whitespacesAndNewlines)
                .replacingOccurrences(of: "^[ \\t]*\\n", with: "", options: .regularExpression) // Removes leading blank lines
                .replacingOccurrences(of: "\\n[ \\t]*$", with: "", options: .regularExpression) // Removes trailing blank lines
        }
}


