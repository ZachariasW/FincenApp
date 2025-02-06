//
//  CommonResponseModel.swift
//  HabuildIt
//
//  Created by Vivek Singh on 14/11/23.
//

import Foundation
struct CommonResponseModel: Codable {
    let response: ResponseCommon?
}

struct ResponseCommon: Codable {
    let success : String?
    let message : String?
   
}
