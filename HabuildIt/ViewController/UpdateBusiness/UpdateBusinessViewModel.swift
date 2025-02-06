//
//  UpdateBusinessViewModel.swift
//  HabuildIt
//
//  Created by Vivek Singh on 26/12/23.
//

import Foundation

final class UpdateBusinessViewModel {
    
    // MARK: - INPUT
    private let repository: HabRepositoryHandling
    
    // MARK: - OUTPUT
    var response: Observable<Result<CommonResponseModel>?> = Observable(nil)
   
    
    
    init(withRepositoryHandling repository: HabRepositoryHandling = HabRepository()
        ) {
            self.repository = repository
           
        }
    
    

    func updateBusiness(bid: String , name:String ) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.EDIT_BUSINESS, forKey: UserDefaultKeys.api)
        repository.editBusiness(parameters: [ServerKeys.BID: bid , ServerKeys.NAME: name,ServerKeys.ACTION: API.EDIT_BUSINESS]) { (result) in
            Loader.hide()
            self.response.value = result
        }
    }
    
    
    
    
   
}
