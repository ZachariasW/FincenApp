//
//  HomeVC+Action.swift
//  HabuildIt
//
//  Created by Vivek Singh on 05/11/23.
//


import Foundation
import UIKit

extension HomeVC {
    
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
        let vc = AddBusinessVC.instantiate(fromAppStoryboard: .homeTabBar)
        vc.hidesBottomBarWhenPushed = true
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
        //           let vc = CMPublicCircleVC.instantiate(fromAppStoryboard: .homeTabBar)
        //           vc.hidesBottomBarWhenPushed = false
        //        //vc.cid = getUserData?[sender.tag].uid ?? ""
        //     //   vc.getPublicCircle = getUserData
        //        navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func buttonToDoList(_ sender: UIButton){
        Console.log("buttonToDoList")
        //          let vc = CMToDoListVC.instantiate(fromAppStoryboard: .homeTabBar)
        //          vc.hidesBottomBarWhenPushed = false
        //       navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func buttonActionMore(_ sender: UIButton){
        Console.log("buttonActionMore")
        
        let vc = NotificationVC.instantiate(fromAppStoryboard: .homeTabBar)
        vc.hidesBottomBarWhenPushed = false
        vc.benificiary = self.benificiary
        navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func buttonActionRearrange(_sender: UIButton)
    {
        
    }
    
}
extension HomeVC : RefreshController {
    func refresh() {
        viewModel.getBusiness(uid: kUserDefaults.getUserId())
    }
    
    
}
