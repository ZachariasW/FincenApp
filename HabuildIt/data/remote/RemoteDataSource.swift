//
//  RemoteDataSource.swift
//  HabuildIt
//
//  Created by Vivek Singh on 05/11/23.
//

import Foundation
import PromiseKit

protocol RemoteDataSourceHandling: AnyObject {
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

final class RemoteDataSource: RemoteDataSourceHandling {
   
    private let getNetworkHandler: NetworkHandling
    
    
    init(withGetWeather getNetworkHandler: NetworkHandling = NetworkHandler()) {
        self.getNetworkHandler = getNetworkHandler
    }
    
    func loginSocial(parameters: [String : Any]?, completion: @escaping (Result<LoginResponseModel>) -> Void) {
        firstly {
            getNetworkHandler.loginSocial(parameters: parameters)
        }.done { (model: LoginResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
   
    
    func login(parameters: [String : Any]?, completion: @escaping (Result<LoginResponseModel>) -> Void) {
        
        firstly {
            getNetworkHandler.login(parameters: parameters)
        }.done { (model: LoginResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
    func register(parameters: [String : Any]?, completion: @escaping (Result<LoginResponseModel>) -> Void) {
        
        firstly {
            getNetworkHandler.login(parameters: parameters)
        }.done { (model: LoginResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
    func addBusiness(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        
        firstly {
            getNetworkHandler.addBusiness(parameters: parameters)
        }.done { (model: CommonResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
    func updateUserName(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        
        firstly {
            getNetworkHandler.updateUserName(parameters: parameters)
        }.done { (model: CommonResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
    func updatePassword(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        
        firstly {
            getNetworkHandler.updatePassword(parameters: parameters)
        }.done { (model: CommonResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
    func updateContact(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        
        firstly {
            getNetworkHandler.updateContact(parameters: parameters)
        }.done { (model: CommonResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
    func getBusinesses(parameters: [String : Any]?, completion: @escaping (Result<BusinessResponseModel>) -> Void) {
        
        firstly {
            getNetworkHandler.getBusinesses(parameters: parameters)
        }.done { (model: BusinessResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
    
    func addBeneficiary(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        firstly {
            getNetworkHandler.addBeneficiary(parameters: parameters)
        }.done { (model: CommonResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
    func getBeneficiary(parameters: [String : Any]?, completion: @escaping (Result<BeneficiaryResponseModel>) -> Void) {
        firstly {
            getNetworkHandler.getBeneficiary(parameters: parameters)
        }.done { (model: BeneficiaryResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
    func getAllBeneficiary(parameters: [String : Any]?, completion: @escaping (Result<BeneficiaryResponseModel>) -> Void) {
        
        firstly {
            getNetworkHandler.getAllBen(parameters: parameters)
        }.done { (model: BeneficiaryResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log("get all ben \(error.localizedDescription)")
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
    
    
    func uploadForm(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        firstly {
            getNetworkHandler.uploadForm(parameters: parameters)
        }.done { (model: CommonResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
    
    func updateForm(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        firstly {
            getNetworkHandler.updateForm(parameters: parameters)
        }.done { (model: CommonResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
    func getBenData(parameters: [String : Any]?, completion: @escaping (Result<BenResponseModel>) -> Void) {
        firstly {
            getNetworkHandler.getBenData(parameters: parameters)
        }.done { (model: BenResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
    func deleteBusiness(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        firstly {
            getNetworkHandler.deleteBusiness(parameters: parameters)
        }.done { (model: CommonResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
    func editBusiness(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        firstly {
            getNetworkHandler.editBusiness(parameters: parameters)
        }.done { (model: CommonResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
    func deleteBeneficiary(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        firstly {
            getNetworkHandler.deleteBeneficiary(parameters: parameters)
        }.done { (model: CommonResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
    func editBeneficiary(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        firstly {
            getNetworkHandler.editBeneficiary(parameters: parameters)
        }.done { (model: CommonResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
    func notifyBen(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        firstly {
            getNetworkHandler.notifyBen(parameters: parameters)
        }.done { (model: CommonResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
    func notifyInBen(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        firstly {
            getNetworkHandler.notifyInBen(parameters: parameters)
        }.done { (model: CommonResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
  
    
    func notifyAll(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        firstly {
            getNetworkHandler.notifyAll(parameters: parameters)
        }.done { (model: CommonResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
    func optIn(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        firstly {
            getNetworkHandler.optIn(parameters: parameters)
        }.done { (model: CommonResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
    func supportMail(parameters: [String : Any]?, completion: @escaping (Result<CommonResponseModel>) -> Void) {
        firstly {
            getNetworkHandler.supportMail(parameters: parameters)
        }.done { (model: CommonResponseModel) in
            
            completion(.success(value: model))
            
        }.catch { (error) in
            Console.log(error.localizedDescription)
            completion(.failure(error: error))
        }.finally {
            
            // DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
    
   
   
}
