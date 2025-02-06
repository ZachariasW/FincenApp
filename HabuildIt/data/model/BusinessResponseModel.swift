//
//  BusinessResponseModel.swift
//  HabuildIt
//
//  Created by Vivek Singh on 15/11/23.
//

import Foundation
// MARK: - BusinessResponseModel
struct BusinessResponseModel: Codable {
    let response: ResponseBusiness
}

// MARK: - Response
struct ResponseBusiness: Codable {
    let success, message: String
    let data: [Business]
}

// MARK: - Datum
struct Business: Codable {
    let createdOn, uid, name, bid: String
    let updatedOn: String

    enum CodingKeys: String, CodingKey {
        case createdOn = "created_on"
        case uid, name, bid
        case updatedOn = "updated_on"
    }
}
