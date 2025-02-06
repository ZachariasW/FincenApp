//
//  Resource.swift
//  ExpatLand
//
//  Created by User on 03/12/21.
//  Copyright © 2021 cypress. All rights reserved.
//

import Foundation
import Alamofire


struct MultiPart{
    let data: Data
    let fileNameWithExt: String
    let serverKey: String
    let mimeType: MediaType
}
enum MediaType: String {
    case image = "image/png"
    case video = "video/mov"
    case file  = "application/octet-stream"
}

enum Resource {
   
    case ADD_BUSINESS
    case GET_BUSINESSES
    case ADD_BENEFICIARY
    case GET_BENEFICIARY
    case UPLOAD_BEN_FORM
    case UPDATE_BEN_FORM
    case GET_BEN_DATA
    case DELETE_BUSINESS
    case EDIT_BUSINESS
    case DELETE_BENEFICIARY
    case EDIT_BENEFICIARY
    case LOGIN
    case SIGNUP
    case FB_LOGIN
    case FOLLOW_DATA
    case FORGET_PASSWORD
    case FORGET_PASSWORD_OTP
    case UPDATE_USERNAME
    case UPDATE_CONTACT
    case CHANGE_PASSWORD
    case UPDATE_PASSWORD
    case CHANGE_CONTACT
    case  TERMINATED
    case UPDATE_FILE
    case UPLOAD_FILE
    case LOGIN_WITH_SOCIAL
    case NOTIFY_BEN
    case NOTIFY_IN_BEN
    case NOTIFY_ALL
    case GET_ALL_BENEFICIARY
    case OPT_IN
    case SUPPORT_MAIL
    
    
    var resource: (method: HTTPMethod, endPoint: String) {
        switch self {
        
            
        case .ADD_BENEFICIARY:
            return (.post, API.ADD_BENEFICIARY)
        case .LOGIN:
            return (.post, API.LOGIN)
        case .SIGNUP:
            return (.post, API.SIGNUP)
        case .FB_LOGIN:
            return (.post, API.FB_LOGIN)
        case .FOLLOW_DATA:
            return (.post, API.FOLLOW_DATA)
        case .FORGET_PASSWORD:
            return (.post, API.FORGET_PASSWORD)
        case .FORGET_PASSWORD_OTP:
            return (.post, API.FORGET_PASSWORD_OTP)
        case .CHANGE_CONTACT:
            return (.post, API.CHANGE_CONTACT)
        case .CHANGE_PASSWORD:
            return (.post, API.CHANGE_PASSWORD)
        case .UPDATE_USERNAME:
            return (.post, API.UPDATE_USERNAME)
        case .UPDATE_CONTACT:
            return (.post, API.UPDATE_CONTACT)
        case .UPDATE_PASSWORD:
            return (.post, API.UPDATE_PASSWORD)
        case .GET_BENEFICIARY:
            return (.post, API.GET_BENEFICIARY)
        case .TERMINATED:
            return (.post, API.TERMINATED)
        case .UPDATE_FILE:
            return (.post, API.UPDATE_FILE)
        case .GET_BUSINESSES:
            return (.post, API.GET_BUSINESSES)
        case .UPLOAD_FILE:
            return (.post, API.UPLOAD_FILE)
        case .UPLOAD_BEN_FORM:
            return (.post, API.UPLOAD_BEN_FORM)
        case .GET_BEN_DATA:
            return (.post, API.GET_BEN_DATA)
        case .ADD_BUSINESS:
            return (.post, API.ADD_BUSINESS)
        case .UPDATE_BEN_FORM:
            return (.post,API.UPDATE_BEN_FORM)
        case .DELETE_BUSINESS:
            return (.post,API.DELETE_BUSINESS)
        case .EDIT_BUSINESS:
            return (.post,API.EDIT_BUSINESS)
        case .DELETE_BENEFICIARY:
            return (.post,API.DELETE_BENEFICIARY)
        case .EDIT_BENEFICIARY:
            return (.post,API.EDIT_BENEFICIARY)
        case .LOGIN_WITH_SOCIAL:
            return (.post,API.LOGIN_WITH_SOCIAL)
        case .NOTIFY_BEN:
            return (.post,API.NOTIFY_BEN)
        case .NOTIFY_IN_BEN:
            return (.post,API.NOTIFY_IN_BEN)
        case .NOTIFY_ALL:
            return (.post,API.NOTIFY_ALL)
        case .GET_ALL_BENEFICIARY:
            return (.post,API.GET_ALL_BENEFICIARY)
        case .OPT_IN:
            return (.post,API.OPT_IN)
        case .SUPPORT_MAIL:
            return (.post,API.SUPPORT_MAIL)
        }
    }
}


public enum Result<T> {
    case success(value:T)
    case failure(error: Error)
    
}
