//
//  BeneficiaryResponseModel.swift
//  HabuildIt
//
//  Created by Vivek Singh on 19/11/23.
//


import Foundation
// MARK: - BeneficiaryResponseModel
struct BeneficiaryResponseModel: Codable {
    let response: ResponseBeneficiary
}

// MARK: - Response
struct ResponseBeneficiary: Codable {
    let success, message: String
    let data: [Beneficiary]
}

// MARK: - Datum
struct Beneficiary: Codable {
    let createdOn, bnid, name, bid,contact,status,form,mobile,expiry: String
    let updatedOn , updateFormOn : String
    let imageUrl: String?

    enum CodingKeys: String, CodingKey {
        case createdOn = "created_on"
        case bnid, name, bid,contact,status,form,mobile,expiry
        case updatedOn = "updated_on"
        case updateFormOn = "update_form_on"
        case imageUrl = "image_url"
    }
}
