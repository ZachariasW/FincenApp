//
//  AppDelegate.swift
//  HabuildIt
//
//  Created by Vivek Singh on 31/10/23.
//

import UIKit
import IQKeyboardManagerSwift
import UserNotifications
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        UIApplication.shared.applicationIconBadgeNumber = 0
        setupTabBarAppearence()
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        UIApplication.shared.applicationIconBadgeNumber = 0
        UNUserNotificationCenter.current().delegate = self
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { (_, error) in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
        }
        
        
        registerForPushNotifications()
        application.registerForRemoteNotifications()
        
        let notificationOption = launchOptions?[.remoteNotification]
        
        // 1
        if let notification = notificationOption as? [String: AnyObject],
           let _ = notification["aps"] as? [String: AnyObject] {
            
            
            
            // 2
            
        }
        
        
//        if let userActDic = launchOptions?[UIApplication.LaunchOptionsKey.userActivityDictionary] as? [String: Any],
//                   let userActivity  = userActDic["UIApplicationLaunchOptionsUserActivityKey"] as? NSUserActivity {
//            openFormController(url: userActivity.webpageURL?.absoluteString)
//                }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    
    func setSwipe(enabled: Bool, navigationController: UINavigationController?){
        if let nav = navigationController as? SwipeableNavigationController {
            nav.isSwipeEnabled = enabled
        }
    }
    
    func setupTabBarAppearence(){
        
        UITabBar.appearance().layer.borderWidth = 0.0
    }
    
    
   
    
    func registerForPushNotifications() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) {
                [weak self] granted, error in
                guard let self = self else { return }
                print("Permission granted: \(granted)")
                
                guard granted else { return }
                
               
                
                // 1
                
                
                self.getNotificationSettings()
            }
    }
    
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            print("Notification settings: \(settings)")
            guard settings.authorizationStatus == .authorized else { return }
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }

    func setUserDataInUserDefault(userData: UserDataInfo?) {
        if let id = userData?.id {
            Constants.userDefaultsShare!.set(id as Any  , forKey: UserDefaultKeys.kUserId)
            Constants.userDefaults.set(id, forKey: UserDefaultKeys.kUserId)
        }
        if let status = userData?.status {
            Constants.userDefaults.set(status, forKey: UserDefaultKeys.kStatus)
        }
        if let updated_on = userData?.updatedOn {
            Constants.userDefaults.set(updated_on, forKey: UserDefaultKeys.kUpdated_on)
        }
        if let profile_pic = userData?.profilePic {
            Constants.userDefaults.set(profile_pic, forKey: UserDefaultKeys.kProfileImage)
        }
        if let bio = userData?.bio {
            Constants.userDefaults.set(bio, forKey: UserDefaultKeys.kBio)
        }
        if let mobile = userData?.mobile {
            Constants.userDefaults.set(mobile, forKey: UserDefaultKeys.kPhoneNumber)
        }
        if let password = userData?.password {
            Constants.userDefaults.set(password, forKey: UserDefaultKeys.kPassword)
        }
        if let username = userData?.username {
            Constants.userDefaults.set(username, forKey: UserDefaultKeys.kUsername)
            Constants.userDefaultsShare!.set(username as Any , forKey: UserDefaultKeys.kUsername)
        }
        if let kLoggedInEmail = userData?.email {
            Constants.userDefaults.set(kLoggedInEmail, forKey: UserDefaultKeys.kLoggedInEmail)
        }
        if let no_of_circle = userData?.noOfCircle {
            Constants.userDefaults.set(no_of_circle, forKey: UserDefaultKeys.kNo_of_circle)
        }
        if let dob = userData?.dob {
            Constants.userDefaults.set(dob, forKey: UserDefaultKeys.kdob)
        }
        
        if let opt = userData?.opt {
            if opt == "1" {
                Constants.userDefaults.set(true, forKey: UserDefaultKeys.kopt)
            }
            else
            {
                Constants.userDefaults.set(false, forKey: UserDefaultKeys.kopt)
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        
      
        Constants.userDefaults.set(true, forKey: UserDefaultKeys.kNotificationStatus)
        
        completionHandler([.alert, .badge, .sound])
    }
    
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        NSLog("[UserNotificationCenter] didReceiveResponse: \(userInfo)")
        //TODO: Handle background notification
        // checkNotification(userInfo: userInfo)
        
        if response.notification.request.trigger is UNPushNotificationTrigger {
               // This is a remote notification
           } else {
               Constants.userDefaults.set(true, forKey: UserDefaultKeys.kNotificationStatus)
           }
        
        
        if let bnid = userInfo["bnid"] as? String,
           let bid = userInfo["bid"] as? String {
           
            let vc = BenDetailsVC.instantiate(fromAppStoryboard: .homeTabBar)
            vc.bId = bid
            vc.bnId = bnid
           
            NSLog("[UserNotificationCenter] didReceiveResponse: Success")
            
            if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
                   // Push the next view controller onto the navigation stack
                   navigationController.pushViewController(vc, animated: true)
               } else {
                   // If the root view controller is not a navigation controller, present the next view controller modally
                   UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
               }
            
            
           
        }
        else
        {
            NSLog("[UserNotificationCenter] didReceiveResponse: failure")
        }
        
        
        
        
        completionHandler()
    }
    
    
   

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        NSLog("[application] didReceiveRemoteNotification: \(userInfo)")
        
       
        
        
        if let bnid = userInfo["bnid"] as? String,
           let bid = userInfo["bid"] as? String {
           
            let vc = BenDetailsVC.instantiate(fromAppStoryboard: .homeTabBar)
            vc.bId = bid
            vc.bnId = bnid
          
            NSLog("[UserNotificationCenter] didReceiveResponse: Success")
            
            if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
                   // Push the next view controller onto the navigation stack
                   navigationController.pushViewController(vc, animated: true)
               } else {
                   // If the root view controller is not a navigation controller, present the next view controller modally
                   UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
               }
            
        }
        else
        {
            NSLog("[UserNotificationCenter] didReceiveResponse: failure")
        }
        
        
        completionHandler(.newData)
    }
    
    

    
    
    func openFormController(url : String? )
    {
        if url != nil {
            self.window = UIApplication.shared.windows.first
            print("only" , url!.onlyNumbers())
            
            let  vc = BeneficiaryFormVC.instantiate(fromAppStoryboard: .homeTabBar)
            vc.ids =  url!.onlyNumbers()
            let nc = SwipeableNavigationController(rootViewController: vc)
            //        self.window = UIWindow(frame: UIScreen.main.bounds)
            nc.modalPresentationStyle = .overCurrentContext
            nc.setNavigationBarHidden(true, animated: false)
            window?.rootViewController = nc
        }
    }
    
}

extension AppDelegate : MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("token" , fcmToken)
       
        Constants.userDefaults.set(fcmToken, forKey: UserDefaultKeys.kDeviceToken)
    }
    
    // iOS9, called when presenting notification in foreground
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        NSLog("[RemoteNotification] didReceiveRemoteNotification for iOS9: \(userInfo)")
        
    
        
        
    }
}
