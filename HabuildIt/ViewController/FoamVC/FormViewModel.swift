//
//  FormViewModel.swift
//  HabuildIt
//
//  Created by Vivek Singh on 19/11/23.
//

import Foundation
final class FormViewModel {
    
    // MARK: - INPUT
    private let repository: HabRepositoryHandling
    
    // MARK: - OUTPUT
    var response: Observable<Result<CommonResponseModel>?> = Observable(nil)
    var responseBen: Observable<Result<BenResponseModel>?> = Observable(nil)
   
    
    
    init(withRepositoryHandling repository: HabRepositoryHandling = HabRepository()
        ) {
            self.repository = repository
           
        }
    
    

    func uploadForm(uid: String , bnid:String ,bid:String,name:String,dob:String,address:String,stateId:String,file:String,pdfData:String,expiry:String) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.UPLOAD_BEN_FORM, forKey: UserDefaultKeys.api)
        repository.uploadForm(parameters: [ServerKeys.BID: bid , ServerKeys.NAME: name,ServerKeys.UID:uid,ServerKeys.DOB:dob,ServerKeys.EXPIRY:expiry,ServerKeys.BNID:bnid,ServerKeys.ADDRESS:address,ServerKeys.STATEID:stateId,ServerKeys.FILE:file,ServerKeys.PDF:pdfData,ServerKeys.ACTION: API.UPLOAD_BEN_FORM]) { (result) in
            Loader.hide()
            self.response.value = result
        }
    }
    
    
    func getBenData(bnid:String) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.GET_BEN_DATA, forKey: UserDefaultKeys.api)
        repository.getBenData(parameters: [ServerKeys.BNID: bnid ,ServerKeys.ACTION: API.GET_BEN_DATA]) { (result) in
            Loader.hide()
            self.responseBen.value = result
        }
    }
    
   
}
