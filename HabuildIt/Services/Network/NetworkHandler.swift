//
//  NetworkHandler.swift
//  ExpatLand
//
//  Created by User on 03/12/21.
//  Copyright © 2021 cypress. All rights reserved.
//

import Foundation
import PromiseKit

protocol NetworkHandling: AnyObject {
    func login<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func loginSocial<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func addBusiness<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func getBusinesses<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func editBusiness<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func deleteBusiness<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func editBeneficiary<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func deleteBeneficiary<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func getBeneficiary<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func notifyBen<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func notifyInBen<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func notifyAll<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func uploadForm<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func updateForm<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func getBenData<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func getAllBen<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func register<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func addBeneficiary<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func reqChangePassword<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func reqChangeContact<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func updateUserName<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func updateContact<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func updatePassword<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func reqTerminateAccount<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func reqForgotPassword<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func reqForgotPasswordOtp<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func optIn<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func uploadFile<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func updateFile<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func supportMail<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>

}

final class NetworkHandler: NetworkHandling {
   
    private let webService: NetworkServiceProtocol
    
    init(withWebService webService: NetworkServiceProtocol = WebService()) {
        self.webService = webService
    }
    
    func login<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        self.webService.request(with: .LOGIN, parameters:  parameters)
    }
    
    func loginSocial<T>(parameters: [String : Any]?) -> PromiseKit.Promise<T> where T : Decodable {
        self.webService.request(with: .LOGIN_WITH_SOCIAL, parameters:  parameters)
    }
    
    func addBusiness<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        self.webService.request(with: .ADD_BUSINESS, parameters:  parameters)
    }
    
    func editBusiness<T>(parameters: [String : Any]?) -> PromiseKit.Promise<T> where T : Decodable {
        self.webService.request(with: .EDIT_BUSINESS, parameters:  parameters)
    }
    
    func deleteBusiness<T>(parameters: [String : Any]?) -> PromiseKit.Promise<T> where T : Decodable {
        self.webService.request(with: .DELETE_BUSINESS, parameters:  parameters)
    }
    
    func editBeneficiary<T>(parameters: [String : Any]?) -> PromiseKit.Promise<T> where T : Decodable {
        self.webService.request(with: .EDIT_BENEFICIARY, parameters:  parameters)
    }
    
    func deleteBeneficiary<T>(parameters: [String : Any]?) -> PromiseKit.Promise<T> where T : Decodable {
        self.webService.request(with: .DELETE_BENEFICIARY, parameters:  parameters)
    }
    
    
    func getBusinesses<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        self.webService.request(with: .GET_BUSINESSES, parameters: parameters)
    }
    
    func register<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        self.webService.request(with: .SIGNUP, parameters:  parameters)
    }
    
    
    func addBeneficiary<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        self.webService.request(with: .ADD_BENEFICIARY, parameters:  parameters)
    }
    
   
    
    func getBeneficiary<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        self.webService.request(with: .GET_BENEFICIARY, parameters:  parameters)
    }
    

    func reqChangePassword<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        self.webService.request(with: .CHANGE_PASSWORD, parameters: parameters)
    }

    func reqChangeContact<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        self.webService.request(with: .CHANGE_CONTACT, parameters: parameters)
    }
    
    func updateUserName<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        self.webService.request(with: .UPDATE_USERNAME, parameters: parameters)
    }
    
    func updateContact<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        self.webService.request(with: .UPDATE_CONTACT, parameters: parameters)
    }
    
    func updatePassword<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        self.webService.request(with: .UPDATE_PASSWORD, parameters: parameters)
    }
    
    func reqTerminateAccount<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        self.webService.request(with: .TERMINATED, parameters: parameters)
    }
    
    func reqForgotPassword<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        self.webService.request(with: .FORGET_PASSWORD, parameters: parameters)
    }

    func reqForgotPasswordOtp<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        self.webService.request(with: .FORGET_PASSWORD_OTP, parameters: parameters)
    }
    
   
    
    func notifyBen<T>(parameters: [String : Any]?) -> PromiseKit.Promise<T> where T : Decodable {
        self.webService.request(with: .NOTIFY_BEN, parameters: parameters)
    }
    
    func notifyInBen<T>(parameters: [String : Any]?) -> PromiseKit.Promise<T> where T : Decodable {
        self.webService.request(with: .NOTIFY_IN_BEN, parameters: parameters)
    }
    
   
   
    func getBenData<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        self.webService.request(with: .GET_BEN_DATA, parameters: parameters)
    }

    

    func uploadFile<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        self.webService.request(with: .UPLOAD_FILE, parameters: parameters)
    }
    
    func uploadForm<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        self.webService.request(with: .UPLOAD_BEN_FORM, parameters: parameters)
    }
    
    func updateForm<T>(parameters: [String : Any]?) -> PromiseKit.Promise<T> where T : Decodable {
        self.webService.request(with: .UPDATE_BEN_FORM, parameters: parameters)
    }
    
    func getAllBen<T>(parameters: [String : Any]?) -> PromiseKit.Promise<T> where T : Decodable {
        self.webService.request(with: .GET_ALL_BENEFICIARY, parameters: parameters)
    }
    
   
    func updateFile<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        self.webService.request(with: .UPDATE_FILE, parameters: parameters)
    }
    
    func notifyAll<T>(parameters: [String : Any]?) -> PromiseKit.Promise<T> where T : Decodable {
        self.webService.request(with: .NOTIFY_ALL, parameters: parameters)
    }
    
    func optIn<T>(parameters: [String : Any]?) -> PromiseKit.Promise<T> where T : Decodable {
        self.webService.request(with: .OPT_IN, parameters: parameters)
    }
    
    func supportMail<T>(parameters: [String : Any]?) -> PromiseKit.Promise<T> where T : Decodable {
        self.webService.request(with: .SUPPORT_MAIL, parameters: parameters)
    }
    
   

}


