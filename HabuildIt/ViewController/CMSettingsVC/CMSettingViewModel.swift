//
//  CMSettingViewModel.swift
//  HabuildIt
//
//  Created by vivek on 2024-11-19.
//

import Foundation

final class CMSettingViewModel {
    
    // MARK: - INPUT
    private let repository: HabRepositoryHandling
    
    // MARK: - OUTPUT
    var response: Observable<Result<CommonResponseModel>?> = Observable(nil)
   
    init(withRepositoryHandling repository: HabRepositoryHandling = HabRepository()
        ) {
            self.repository = repository
           
        }
    
    func didTapOptIn(userId: String , optIn:String ) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.LOGIN, forKey: UserDefaultKeys.api)
        repository.optIn(parameters: [ServerKeys.UID: userId , ServerKeys.OTP_IN: optIn,ServerKeys.ACTION: API.OPT_IN]) { (result) in
            Loader.hide()
            self.response.value = result
        }
    }
    
}
