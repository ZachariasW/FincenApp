//
//  MainTabBarVC.swift
//  HabuildIt
//
//  Created by Vivek Singh on 05/11/23.
//

import Foundation
import UIKit

class MainTabBarVC: UITabBarController , UITabBarControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarAearance()
        self.tabBar.items?[0].image = UIImage(named: "homeSim")?.withRenderingMode(.alwaysOriginal)
        self.tabBar.items?[0].selectedImage = UIImage(named: "home")?.withRenderingMode(.alwaysOriginal)
        
        self.tabBar.items?[1].image = UIImage(named: "myProfile")?.withRenderingMode(.alwaysOriginal)
        self.tabBar.items?[1].selectedImage = UIImage(named: "my_profile")?.withRenderingMode(.alwaysOriginal)

        
        
    }

    
    func tabBarAearance(){
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        Constants.sharedAppDelegate.setSwipe(enabled: true, navigationController: navigationController)
        tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        tabBar.layer.shadowOpacity = 0.5
        tabBar.layer.shadowOffset = CGSize.zero
        tabBar.layer.shadowRadius = 5
        self.tabBar.layer.borderColor = UIColor(named: "F6F6F6")?.cgColor
        self.tabBar.layer.masksToBounds = false
        if #available(iOS 13.0, *) {
            let appearance = tabBar.standardAppearance.copy()
            appearance.configureWithTransparentBackground()
            self.tabBar.standardAppearance = appearance
            UITabBarItem.appearance().badgeColor = .purple
        } else {
            tabBar.shadowImage = UIImage()
            tabBar.backgroundImage = UIImage()
        }
    }
    func switchToTab(index: Int){
        selectedIndex = index
    }
}





