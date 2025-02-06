//
//  HomeViewModel.swift
//  HabuildIt
//
//  Created by Vivek Singh on 14/11/23.
//

import Foundation

final class HomeViewModel {
    
    // MARK: - INPUT
    private let repository: HabRepositoryHandling
    
    // MARK: - OUTPUT
    var response: Observable<Result<BusinessResponseModel>?> = Observable(nil)
    var responseDelete: Observable<Result<CommonResponseModel>?> = Observable(nil)
    var responseBeneficiary: Observable<Result<BeneficiaryResponseModel>?> = Observable(nil)
    
    
    init(withRepositoryHandling repository: HabRepositoryHandling = HabRepository()
        ) {
            self.repository = repository
           
        }
    
    

    func getBusiness(uid: String ) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.GET_BUSINESSES, forKey: UserDefaultKeys.api)
        repository.getBusinesses(parameters: [ServerKeys.UID: uid ,ServerKeys.ACTION: API.GET_BUSINESSES]) { (result) in
            Loader.hide()
            self.response.value = result
        }
    }
    
    
    func deleteBusiness(bid: String ) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.DELETE_BUSINESS, forKey: UserDefaultKeys.api)
        repository.deleteBusiness(parameters: [ServerKeys.BID: bid ,ServerKeys.ACTION: API.DELETE_BUSINESS]) { (result) in
            Loader.hide()
            self.responseDelete.value = result
        }
    }
    
    func getAllBeneficiary(uid: String ) {
        
        Loader.show()
        Constants.userDefaults.setValue(API.GET_ALL_BENEFICIARY, forKey: UserDefaultKeys.api)
        repository.getAllBeneficiary(parameters: [ServerKeys.UID: uid ,ServerKeys.ACTION: API.GET_ALL_BENEFICIARY]) { (result) in
            Loader.hide()
            self.responseBeneficiary.value = result
        }
    }
    
    
    func beneficiaryWithExpiry(ben : [Beneficiary]) -> [Beneficiary]
    {
        var filterdata : [Beneficiary] = []
        
        ben.forEach { data in
            if isMoreThan29DaysApart(from: data.expiry)
            {
                 filterdata.append(data)
             }
        }
        
        return filterdata
    }
 
    
    func isMoreThan29DaysApart(from dateString: String) -> Bool {
        // Create a date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy" // Adjust the date format as needed
        
        // Convert the input dateString to a Date object
        guard let inputDate = dateFormatter.date(from: dateString) else {
            print("Error: Invalid date format")
            return false
        }
        
        // Get the current date
        let currentDate = Date()
        
        // Calculate the difference in days
        let calendar = Calendar.current
        if let differenceInDays = calendar.dateComponents([.day], from: currentDate, to: inputDate).day {
            // Check if the difference is more than 29 days
            return differenceInDays < 30
        } else {
            print("Error: Failed to calculate the difference in days")
            return false
        }
    }
    
}
