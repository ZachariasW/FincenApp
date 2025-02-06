//
//  NotifyBenViewModel.swift
//  HabuildIt
//
//  Created by Vivek Singh on 11/03/24.
//

import Foundation
import Foundation

final class NotifyBenViewModel {
    
    // MARK: - INPUT
    private let repository: HabRepositoryHandling
    
    // MARK: - OUTPUT
    var response: Observable<Result<CommonResponseModel>?> = Observable(nil)
   
    
    
    init(withRepositoryHandling repository: HabRepositoryHandling = HabRepository()
        ) {
            self.repository = repository
           
        }
    
    

    func notifyBen(uid: String ) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.NOTIFY_ALL, forKey: UserDefaultKeys.api)
        repository.notifyAll(parameters: [ServerKeys.UID: uid , ServerKeys.ACTION: API.NOTIFY_ALL]) { (result) in
            Loader.hide()
            self.response.value = result
        }
    }
    
    
    
    
   
}
