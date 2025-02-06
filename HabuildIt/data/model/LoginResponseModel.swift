//
//  LoginResponseModel.swift
//  HabuildIt
//
//  Created by Vivek Singh on 07/11/23.
//

import Foundation

struct LoginResponseModel: Codable {
    let response: ResponseLogin?
}

struct ResponseLogin: Codable {
    let success : String?
    let message : String?
    let data : [UserDataInfo]?
}

public struct UserDataInfo : Codable , Equatable {
    
    let id : String?
    let status : String?
    let updatedOn : String?
    let mobile : String?
    let dob : String?
    let profilePic : String?
    let bio : String?
    let createdOn : String?
    let password : String?
    let username : String?
    let email : String?
    let name : String?
    let noOfCircle : String?
    var badge : String?
    let opt : String?
     
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
        case updatedOn = "updated_on"
        case mobile = "mobile"
        case dob = "dob"
        case profilePic = "profile_pic"
        case bio = "bio"
        case createdOn = "created_on"
        case password = "password"
        case username = "username"
        case email = "email"
        case name = "name"
        case noOfCircle = "no_of_circle"
        case badge = "badge"
        case opt = "opt"
    
    }
    
    public static func ==(lhs: UserDataInfo, rhs: UserDataInfo) -> Bool {
        
        return lhs.id == rhs.id && lhs.username == rhs.username
    }
}


