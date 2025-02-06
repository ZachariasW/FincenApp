//
//  AddBusinessViewModel.swift
//  HabuildIt
//
//  Created by Vivek Singh on 14/11/23.
//

import Foundation

final class AddBusinessViewModel {
    
    // MARK: - INPUT
    private let repository: HabRepositoryHandling
    
    // MARK: - OUTPUT
    var response: Observable<Result<CommonResponseModel>?> = Observable(nil)
   
    
    
    init(withRepositoryHandling repository: HabRepositoryHandling = HabRepository()
        ) {
            self.repository = repository
           
        }
    
    

    func addBusiness(uid: String , name:String ) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.ADD_BUSINESS, forKey: UserDefaultKeys.api)
        repository.addBusiness(parameters: [ServerKeys.UID: uid , ServerKeys.NAME: name,ServerKeys.ACTION: API.ADD_BUSINESS]) { (result) in
            Loader.hide()
            self.response.value = result
        }
    }
    
    
    
    
   
}
