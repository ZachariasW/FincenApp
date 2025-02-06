//
//  UserNameViewModel.swift
//  HabuildIt
//
//  Created by Vivek Singh on 15/11/23.
//

import Foundation

final class UserNameViewModel {
    
    // MARK: - INPUT
    private let repository: HabRepositoryHandling
    
    // MARK: - OUTPUT
    var response: Observable<Result<CommonResponseModel>?> = Observable(nil)
   
    
    
    init(withRepositoryHandling repository: HabRepositoryHandling = HabRepository()
        ) {
            self.repository = repository
           
        }
    
    

    func updateUserName(uid: String , name:String ) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.UPDATE_USERNAME, forKey: UserDefaultKeys.api)
        repository.updateUserName(parameters: [ServerKeys.UID: uid , ServerKeys.USERNAME: name,ServerKeys.ACTION: API.UPDATE_USERNAME]) { (result) in
            Loader.hide()
            self.response.value = result
        }
    }
    
    
    
    
   
}
