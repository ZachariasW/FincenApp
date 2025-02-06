//
//  EditPasswordViewModel.swift
//  HabuildIt
//
//  Created by Vivek Singh on 19/11/23.
//

import Foundation
final class EditPasswordViewModel {
    
    // MARK: - INPUT
    private let repository: HabRepositoryHandling
    
    // MARK: - OUTPUT
    var response: Observable<Result<CommonResponseModel>?> = Observable(nil)
   
    
    
    init(withRepositoryHandling repository: HabRepositoryHandling = HabRepository()
        ) {
            self.repository = repository
           
        }
    
    

    func updatePassword(uid: String , password:String ) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.UPDATE_PASSWORD, forKey: UserDefaultKeys.api)
        repository.updateUserName(parameters: [ServerKeys.UID: uid , ServerKeys.PASSWORD: password,ServerKeys.ACTION: API.UPDATE_USERNAME]) { (result) in
            Loader.hide()
            self.response.value = result
        }
    }
    
    
    
    
   
}
