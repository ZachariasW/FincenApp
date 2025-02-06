//
//  AddBeneficiaryViewModel.swift
//  HabuildIt
//
//  Created by Vivek Singh on 19/11/23.
//

import Foundation
final class AddBeneficiaryViewModel {
    
    // MARK: - INPUT
    private let repository: HabRepositoryHandling
    
    // MARK: - OUTPUT
    var response: Observable<Result<CommonResponseModel>?> = Observable(nil)
   
    
    
    init(withRepositoryHandling repository: HabRepositoryHandling = HabRepository()
        ) {
            self.repository = repository
           
        }
    
    

    func addBeneficiary(bid: String , name:String ,contact:String,mobile:String) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.ADD_BENEFICIARY, forKey: UserDefaultKeys.api)
        repository.addBusiness(parameters: [ServerKeys.BID: bid , ServerKeys.NAME: name,ServerKeys.CONTACT:contact,ServerKeys.MOBILE:mobile,ServerKeys.ACTION: API.ADD_BENEFICIARY]) { (result) in
            Loader.hide()
            self.response.value = result
        }
    }
    
    
    
    
   
}
