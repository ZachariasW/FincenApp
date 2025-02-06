//
//  ShareViewModel.swift
//  HabuildIt
//
//  Created by vivek on 2024-06-10.
//

import Foundation
final class ShareViewModel {
    
    // MARK: - INPUT
    private let repository: HabRepositoryHandling
    
    // MARK: - OUTPUT
    var response: Observable<Result<CommonResponseModel>?> = Observable(nil)
   
    
    
    init(withRepositoryHandling repository: HabRepositoryHandling = HabRepository()
        ) {
            self.repository = repository
           
        }
    
    

    func notifyInBen(uid: String ,bid:String ,bnid:String) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.NOTIFY_IN_BEN, forKey: UserDefaultKeys.api)
        repository.notifyAll(parameters: [ServerKeys.UID: uid , ServerKeys.BID:bid,ServerKeys.BNID:bnid,ServerKeys.ACTION: API.NOTIFY_IN_BEN]) { (result) in
            Loader.hide()
            self.response.value = result
        }
    }
    
    
    
    
   
}
