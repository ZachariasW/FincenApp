//
//  EditContactViewModel.swift
//  HabuildIt
//
//  Created by Vivek Singh on 19/11/23.
//

import Foundation

final class EditContactViewModel {
    
    // MARK: - INPUT
    private let repository: HabRepositoryHandling
    
    // MARK: - OUTPUT
    var response: Observable<Result<CommonResponseModel>?> = Observable(nil)
   
    
    
    init(withRepositoryHandling repository: HabRepositoryHandling = HabRepository()
        ) {
            self.repository = repository
           
        }
    
    

    func updateContact(uid: String , contact:String ) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.UPDATE_CONTACT, forKey: UserDefaultKeys.api)
        repository.updateContact(parameters: [ServerKeys.UID: uid , ServerKeys.CONTACT: contact,ServerKeys.ACTION: API.UPDATE_CONTACT]) { (result) in
            Loader.hide()
            self.response.value = result
        }
    }
    
    
    
    
   
}
