//
//  HabRepository.swift
//  HabuildIt
//
//  Created by Vivek Singh on 05/11/23.
//

import Foundation
import PromiseKit

protocol HabRepositoryHandling: AnyObject {
    func login(parameters:[ String: Any]? ,completion: @escaping (Result<LoginResponseModel>) -> Void)
    func loginSocial(parameters:[ String: Any]? ,completion: @escaping (Result<LoginResponseModel>) -> Void)
    func register(parameters:[ String: Any]? ,completion: @escaping (Result<LoginResponseModel>) -> Void)
    func addBusiness(parameters:[ String: Any]? ,completion: @escaping (Result<CommonResponseModel>) -> Void)
    func deleteBusiness(parameters:[ String: Any]? ,completion: @escaping (Result<CommonResponseModel>) -> Void)
    func editBusiness(parameters:[ String: Any]? ,completion: @escaping (Result<CommonResponseModel>) -> Void)
    func deleteBeneficiary(parameters:[ String: Any]? ,completion: @escaping (Result<CommonResponseModel>) -> Void)
    func editBeneficiary(parameters:[ String: Any]? ,completion: @escaping (Result<CommonResponseModel>) -> Void)
    func updateUserName(parameters:[ String: Any]? ,completion: @escaping (Result<CommonResponseModel>) -> Void)
    func updateContact(parameters:[ String: Any]? ,completion: @escaping (Result<CommonResponseModel>) -> Void)
    func updatePassword(parameters:[ String: Any]? ,completion: @escaping (Result<CommonResponseModel>) -> Void)
    func getBusinesses(parameters:[ String: Any]? ,completion: @escaping (Result<BusinessResponseModel>) -> Void)
    func addBeneficiary(parameters:[ String: Any]? ,completion: @escaping (Result<CommonResponseModel>) -> Void)
    func getBeneficiary(parameters:[ String: Any]? ,completion: @escaping (Result<BeneficiaryResponseModel>) -> Void)
    func getAllBeneficiary(parameters:[ String: Any]? ,completion: @escaping (Result<BeneficiaryResponseModel>) -> Void)
    func uploadForm(parameters:[ String: Any]? ,completion: @escaping (Result<CommonResponseModel>) -> Void)
    func updateForm(parameters:[ String: Any]? ,completion: @escaping (Result<CommonResponseModel>) -> Void)
    func getBenData(parameters:[ String: Any]? ,completion: @escaping (Result<BenResponseModel>) -> Void)
    func notifyBen(parameters:[ String: Any]? ,completion: @escaping (Result<CommonResponseModel>) -> Void)
    func notifyInBen(parameters:[ String: Any]? ,completion: @escaping (Result<CommonResponseModel>) -> Void)
    func notifyAll(parameters:[ String: Any]? ,completion: @escaping (Result<CommonResponseModel>) -> Void)
    func optIn(parameters:[ String: Any]? ,completion: @escaping (Result<CommonResponseModel>) -> Void)
    func supportMail(parameters:[ String: Any]? ,completion: @escaping (Result<CommonResponseModel>) -> Void)
}

final class HabRepository: HabRepositoryHandling {
   
    private let getRemoteDataSource: RemoteDataSourceHandling
    
    init(withGetWeather getRemoteDataSource: RemoteDataSourceHandling = RemoteDataSource()) {
           self.getRemoteDataSource = getRemoteDataSource
         //  self.realmManager = realmManager
       }
    
    func login(parameters: [String : Any]?, completion: @escaping (Result<LoginResponseModel>) -> Void) {
        self.getRemoteDataSource.login(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
    func loginSocial(parameters: [String : Any]?, completion: @escaping (Result<LoginResponseModel>) -> Void) {
        self.getRemoteDataSource.loginSocial(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
    
    
    func register(parameters: [String : Any]?, completion: @escaping (Result<LoginResponseModel>) -> Void) {
        self.getRemoteDataSource.login(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
    func addBusiness(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        self.getRemoteDataSource.addBusiness(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
    func updateUserName(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        self.getRemoteDataSource.updateUserName(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
    func updateContact(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        self.getRemoteDataSource.updateContact(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
    func updatePassword(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        self.getRemoteDataSource.updatePassword(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
    func getBusinesses(parameters: [String : Any]?, completion: @escaping (Result<BusinessResponseModel>) -> Void) {
        self.getRemoteDataSource.getBusinesses(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
    func addBeneficiary(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        self.getRemoteDataSource.addBeneficiary(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
    func getBeneficiary(parameters: [String : Any]?, completion: @escaping (Result<BeneficiaryResponseModel>) -> Void) {
        self.getRemoteDataSource.getBeneficiary(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
    func getAllBeneficiary(parameters: [String : Any]?, completion: @escaping (Result<BeneficiaryResponseModel>) -> Void) {
        self.getRemoteDataSource.getAllBeneficiary(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
  
    
    func uploadForm(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        
        self.getRemoteDataSource.uploadForm(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
    
    func updateForm(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        
        self.getRemoteDataSource.updateForm(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
   
    func getBenData(parameters: [String : Any]?, completion: @escaping (Result<BenResponseModel>) -> Void) {
        self.getRemoteDataSource.getBenData(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
    func deleteBusiness(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        self.getRemoteDataSource.deleteBusiness(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
    func editBusiness(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        self.getRemoteDataSource.editBusiness(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
    func deleteBeneficiary(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        self.getRemoteDataSource.deleteBeneficiary(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
    func editBeneficiary(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        self.getRemoteDataSource.editBeneficiary(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
   
    func notifyBen(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        self.getRemoteDataSource.notifyBen(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
    func notifyInBen(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        self.getRemoteDataSource.notifyInBen(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
  
    
    func notifyAll(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        self.getRemoteDataSource.notifyAll(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
    func optIn(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        self.getRemoteDataSource.optIn(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
    func supportMail(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        self.getRemoteDataSource.supportMail(parameters: parameters) { (result) in
            switch result {
            case .success(value: let value):
                completion(.success(value: value))
            case .failure(error: let error):
                completion(.failure(error: error))
            }
        }
    }
    
   
   
}
