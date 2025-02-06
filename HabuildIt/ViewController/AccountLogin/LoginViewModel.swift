//
//  LoginViewModel.swift
//  HabuildIt
//
//  Created by Vivek Singh on 07/11/23.
//

import Foundation
import Foundation

final class LoginViewModel {
    
    // MARK: - INPUT
    private let repository: HabRepositoryHandling
    
    // MARK: - OUTPUT
    var response: Observable<Result<LoginResponseModel>?> = Observable(nil)
   
    
    
    init(withRepositoryHandling repository: HabRepositoryHandling = HabRepository()
        ) {
            self.repository = repository
           
        }
    
    

    func didTapLogin(userName: String , password:String , token: String ) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.LOGIN, forKey: UserDefaultKeys.api)
        repository.login(parameters: [ServerKeys.USERNAME: userName , ServerKeys.PASSWORD: password,ServerKeys.FCM_TOKEN:token,ServerKeys.ACTION: API.LOGIN]) { (result) in
            Loader.hide()
            self.response.value = result
        }
    }
    
    
    func socialLogin(userName: String , password:String , email:String , appleId:String , token: String ) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.LOGIN_WITH_SOCIAL, forKey: UserDefaultKeys.api)
        repository.loginSocial(parameters: [ServerKeys.USERNAME: userName , ServerKeys.PASSWORD: password,ServerKeys.FCM_TOKEN:token,ServerKeys.EMAIL:email,ServerKeys.APPLE_ID:appleId,ServerKeys.ACTION: API.LOGIN_WITH_SOCIAL]) { (result) in
            Loader.hide()
            self.response.value = result
        }
    }
    

}
