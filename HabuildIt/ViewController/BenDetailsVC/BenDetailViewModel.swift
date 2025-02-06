//
//  BenDetailViewModel.swift
//  HabuildIt
//
//  Created by Vivek Singh on 21/11/23.
//

import Foundation
final class BenDetailViewModel {
    
    // MARK: - INPUT
    private let repository: HabRepositoryHandling
    
    // MARK: - OUTPUT
    var response: Observable<Result<BenResponseModel>?> = Observable(nil)
    var responseCommon: Observable<Result<CommonResponseModel>?> = Observable(nil)
    
    
    init(withRepositoryHandling repository: HabRepositoryHandling = HabRepository()
        ) {
            self.repository = repository
           
        }
    
    

    func getBenData(bnid:String) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.GET_BEN_DATA, forKey: UserDefaultKeys.api)
        repository.getBenData(parameters: [ServerKeys.BNID: bnid ,ServerKeys.ACTION: API.GET_BEN_DATA]) { (result) in
            Loader.hide()
            self.response.value = result
        }
    }
    
    
    func uploadForm(uid: String , bnid:String ,bid:String,name:String,dob:String,address:String,stateId:String,expiry:String,file:String,pdfData:String, imageUrl : String) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.UPDATE_BEN_FORM, forKey: UserDefaultKeys.api)
        repository.updateForm(parameters: [ServerKeys.BID: bid , ServerKeys.NAME: name,ServerKeys.UID:uid,ServerKeys.DOB:dob,ServerKeys.BNID:bnid,ServerKeys.ADDRESS:address,ServerKeys.STATEID:stateId,ServerKeys.EXPIRY:expiry,ServerKeys.FILE:file,ServerKeys.PDF:pdfData,ServerKeys.IMAGE: imageUrl,ServerKeys.ACTION: API.UPDATE_BEN_FORM]) { (result) in
            Loader.hide()
            self.responseCommon.value = result
        }
    }
    
   
}
