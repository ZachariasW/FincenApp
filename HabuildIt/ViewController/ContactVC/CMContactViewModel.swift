//
//  CMContactViewModel.swift
//  HabuildIt
//
//  Created by vivek on 2024-12-20.
//

import Foundation

final class CMContactViewModel {
    
    // MARK: - INPUT
    private let repository: HabRepositoryHandling
    
    // MARK: - OUTPUT
    var response: Observable<Result<CommonResponseModel>?> = Observable(nil)
   
    
    
    init(withRepositoryHandling repository: HabRepositoryHandling = HabRepository()
        ) {
            self.repository = repository
           
        }
    
    

    func supportMail(message:String ) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.SUPPORT_MAIL, forKey: UserDefaultKeys.api)
        repository.supportMail(parameters: [ServerKeys.MESSAGE: message,ServerKeys.ACTION: API.SUPPORT_MAIL]) { (result) in
            Loader.hide()
            self.response.value = result
        }
    }
    
    
   
}

