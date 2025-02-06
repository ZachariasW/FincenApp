//
//  SignupViewModel.swift
//  HabuildIt
//
//  Created by Vivek Singh on 14/11/23.
//

import Foundation
import Foundation

final class SignupViewModel {
    
    // MARK: - INPUT
    private let repository: HabRepositoryHandling
    
    // MARK: - OUTPUT
    var response: Observable<Result<LoginResponseModel>?> = Observable(nil)
   
    
    
    init(withRepositoryHandling repository: HabRepositoryHandling = HabRepository()
        ) {
            self.repository = repository
           
        }
    
    

    func didTapRegister(userName: String ,email:String, password:String , mobile:String,token: String ) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.SIGNUP, forKey: UserDefaultKeys.api)
        repository.register(parameters: [ServerKeys.USERNAME: userName ,ServerKeys.NAME:userName, ServerKeys.PASSWORD: password,ServerKeys.EMAIL:email,ServerKeys.BIO: "Say something about yourself!",ServerKeys.DOB:"NA",ServerKeys.MOBILE:mobile,ServerKeys.FCM_TOKEN:token,ServerKeys.ACTION: API.SIGNUP]) { (result) in
            Loader.hide()
            self.response.value = result
        }
    }
    
    
    
    
   
}
