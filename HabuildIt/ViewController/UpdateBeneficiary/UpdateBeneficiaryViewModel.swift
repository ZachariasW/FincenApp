//
//  UpdateBeneficiaryViewModel.swift
//  HabuildIt
//
//  Created by Vivek Singh on 27/12/23.
//

import Foundation
final class UpdateBeneficiaryViewModel {
    
    // MARK: - INPUT
    private let repository: HabRepositoryHandling
    
    // MARK: - OUTPUT
    var response: Observable<Result<CommonResponseModel>?> = Observable(nil)
    var responseNotify: Observable<Result<CommonResponseModel>?> = Observable(nil)
    
    
    init(withRepositoryHandling repository: HabRepositoryHandling = HabRepository()
        ) {
            self.repository = repository
           
        }
    
    

    func editBeneficiary(bnid: String , name:String ,contact:String,mobile:String) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.EDIT_BENEFICIARY, forKey: UserDefaultKeys.api)
        repository.addBusiness(parameters: [ServerKeys.BNID: bnid , ServerKeys.NAME: name,ServerKeys.CONTACT:contact,ServerKeys.MOBILE:mobile,ServerKeys.ACTION: API.EDIT_BENEFICIARY]) { (result) in
            Loader.hide()
            self.response.value = result
        }
    }
    
    
    func notifyInBen(uid: String ,bid:String ,bnid:String) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.NOTIFY_IN_BEN, forKey: UserDefaultKeys.api)
        repository.notifyAll(parameters: [ServerKeys.UID: uid , ServerKeys.BID:bid,ServerKeys.BNID:bnid,ServerKeys.ACTION: API.NOTIFY_IN_BEN]) { (result) in
            Loader.hide()
            self.responseNotify.value = result
        }
    }
    
   
}
