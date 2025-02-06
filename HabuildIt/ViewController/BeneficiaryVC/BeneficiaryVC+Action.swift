//
//  BeneficiaryVC+Action.swift
//  HabuildIt
//
//  Created by Vivek Singh on 19/11/23.
//

import Foundation
import UIKit

extension BeneficiaryVC {
    
    @IBAction func buttonActionNotify(_ sender: UIButton){
        Console.log("buttonActionNotify")
//        let vc = LawfirmVC.instantiate(fromAppStoryboard: .homeTabBar)
//        vc.hidesBottomBarWhenPushed = false
//        vc.cid = self.getUserData?.first?.id ?? ""
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func buttonActionLawfirm(_ sender: UIButton){
        Console.log("buttonActionLawfirm")
//        let vc = LawfirmVC.instantiate(fromAppStoryboard: .homeTabBar)
//        vc.hidesBottomBarWhenPushed = false
//        vc.cid = self.getUserData?.first?.id ?? ""
//        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func buttonActionViewAll(_ sender: UIButton) {
        Console.log("buttonActionViewAll")
//        let vc = CMCircleListViewAllVC.instantiate(fromAppStoryboard: .homeTabBar)
//        vc.hidesBottomBarWhenPushed = true
//     //   vc.getUserData = getUserList?.response?.data
//        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func buttonActionCreateCircle(_ sender: UIButton) {
        Console.log("buttonActionCreateCircle")
        Console.log("buttonActionBio")
        let vc = AddBeneficiaryVC.instantiate(fromAppStoryboard: .homeTabBar)
        vc.hidesBottomBarWhenPushed = true
        vc.bid = self.bid
        vc.delegate = self
        navigationController?.present(vc, animated: true, completion: nil)
    }
    @IBAction func buttonActionInvestingBuddies(_ sender: UIButton) {
        Console.log("buttonActionInvestingBuddies")
//        let vc = LawfirmVC.instantiate(fromAppStoryboard: .homeTabBar)
//        vc.hidesBottomBarWhenPushed = false
//        vc.cid = self.getUserData?[1].id ?? ""
//        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func buttonActionDownloadForm(_ sender: UIButton) {
        Console.log("buttonActionDownloadForm")

        
    }
    
    @IBAction func buttonActionReminder(_ sender: UIButton){
        Console.log("buttonActionReminder")
      //  let vc = PostAddVC.instantiate(fromAppStoryboard: .homeTabBar)
//        let vc = CMRemindersVC.instantiate(fromAppStoryboard: .homeTabBar)
//           vc.screenType = .editPost
//        vc.hidesBottomBarWhenPushed = true
////        vc.screenType = .addPost
////        vc.delegate = self
////        vc.postType = .normal
//       navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func buttonSearchPublicCircles(_ sender: UIButton){
           Console.log("buttonSearchPublicCircles")
             popViewController()

       }
    @IBAction func buttonToDoList(_ sender: UIButton){
          Console.log("buttonToDoList")
//          let vc = CMToDoListVC.instantiate(fromAppStoryboard: .homeTabBar)
//          vc.hidesBottomBarWhenPushed = false
//       navigationController?.pushViewController(vc, animated: true)
      }
    @IBAction func buttonActionMore(_ sender: UIButton){
           Console.log("buttonActionMore")

        let alert = UIAlertController(title: "HabuildIt", message: "Do you want to notify all beneficiaries to update their form.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { action in

            self.viewModel.notifyBen(bid: self.bid, uid: kUserDefaults.getUserId())


        }))
        alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: nil))
        self.present(alert, animated: true)
        
       }
    @IBAction func buttonActionRearrange(_sender: UIButton)
    {
       // let urls = businesses.map { $0.form}
        
        businesses.forEach{ link in
            if let url = URL(string: link.form) {
                downloadManager.addDownload(url,mainFolder: businessName,subFolder: link.contact)
            }
            
            if let imgUrl = URL(string: link.imageUrl ?? "") {
                downloadManager.addDownload(imgUrl,mainFolder: businessName,subFolder: link.contact)
            }
        }
        
    }

}


extension BeneficiaryVC : RefreshController {
    func refresh() {
      
        viewModel.getBeneficiary(bid: bid)
    }
    
    
}

extension BeneficiaryVC: DownloadProcessProtocol {
    func downloadingProgress(_ percent: Float, fileName: String) {
        Loader.show(message: "Please wait saving files")
    }
    
    func downloadSucceeded(_ fileName: String) {
        print(fileName)
        Loader.hide()
        BannerManager.shared.showBanner(message: "Saved Successfully", type: .success)
    }
    
    func downloadWithError(_ error: Error?, fileName: String) {
     //   print(error?.localizedDescription)
    }
    
    
   
}
