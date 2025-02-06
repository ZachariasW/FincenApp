//
//  BenResponseModel.swift
//  HabuildIt
//
//  Created by Vivek Singh on 21/11/23.
//


import Foundation
// MARK: - BenResponseModel
struct BenResponseModel: Codable {
    let response: ResponseBen
}

// MARK: - Response
struct ResponseBen: Codable {
    let success, message: String
    let data: [BenData]
}

// MARK: - Datum
struct BenData: Codable {
    let createdOn, bnid, name, bid,stateId,imageUrl,address,id,dob,expiry: String
    let updatedOn: String

    enum CodingKeys: String, CodingKey {
        case createdOn = "created_on"
        case bnid, name, bid,address,id,dob,expiry
        case updatedOn = "updated_on"
        case stateId = "state_id"
        case imageUrl = "image_url"
    }
}
