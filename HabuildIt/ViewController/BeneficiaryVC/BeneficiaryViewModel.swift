//
//  BeneficiaryViewModel.swift
//  HabuildIt
//
//  Created by Vivek Singh on 19/11/23.
//

import Foundation

final class BeneficiaryViewModel {
    
    // MARK: - INPUT
    private let repository: HabRepositoryHandling
    
    // MARK: - OUTPUT
    var response: Observable<Result<BeneficiaryResponseModel>?> = Observable(nil)
    var responseDelete: Observable<Result<CommonResponseModel>?> = Observable(nil)
    var responseNotify: Observable<Result<CommonResponseModel>?> = Observable(nil)
    
    
    init(withRepositoryHandling repository: HabRepositoryHandling = HabRepository()
        ) {
            self.repository = repository
           
        }
    
    

    func getBeneficiary(bid: String ) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.GET_BENEFICIARY, forKey: UserDefaultKeys.api)
        repository.getBeneficiary(parameters: [ServerKeys.BID: bid ,ServerKeys.ACTION: API.GET_BENEFICIARY]) { (result) in
            Loader.hide()
            self.response.value = result
        }
    }
    
    
    func deleteBeneficiary(bnid: String ) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.DELETE_BENEFICIARY, forKey: UserDefaultKeys.api)
        repository.deleteBusiness(parameters: [ServerKeys.BNID: bnid ,ServerKeys.ACTION: API.DELETE_BENEFICIARY]) { (result) in
            Loader.hide()
            self.responseDelete.value = result
        }
    }
    
    func notifyBen(bid:String,uid:String)
    {
        Loader.show()
        Constants.userDefaults.setValue(API.NOTIFY_BEN, forKey: UserDefaultKeys.api)
        repository.notifyBen(parameters: [ServerKeys.BID: bid ,ServerKeys.UID:uid,ServerKeys.ACTION: API.NOTIFY_BEN]) { (result) in
            Loader.hide()
            self.responseNotify.value = result
        }
    }
   
}
