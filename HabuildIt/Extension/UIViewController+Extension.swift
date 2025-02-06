//
//  UIViewController+Extension.swift
//  WeekInChina
//
//  Created by Kanika Mishra on 08/03/19.
//  Copyright © 2019 MobileCoderz. All rights reserved.
//


import Foundation
import UIKit


extension UIViewController {
    
    class var storyboardID : String {
        return "\(self)"
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
    func delay(time:TimeInterval,completionHandler: @escaping ()->()) {
        let when = DispatchTime.now() + time
        DispatchQueue.main.asyncAfter(deadline: when) {
            completionHandler()
        }
    }
    
    func showCustomAlertWithHandler(title: String, message: String, titleColor: UIColor, messageColor: UIColor, alertTintColor: UIColor,buttonCancel: String, buttonTitle: String, completion:@escaping()-> Void) {
        let alert = UIAlertController(title: title,message: message, preferredStyle: .alert)
        let allowAction = UIAlertAction(title: buttonTitle, style: .default) { (actionHandler) in
            completion()
        }
        alert.addAction(allowAction)
//        let cancelAction = UIAlertAction(title: buttonCancel, style: .cancel) { (actionHandler) in
//            self.dismiss(animated: true, completion: nil)
//        }
//        alert.addAction(cancelAction)
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(named: "EFEFEF")
        alert.view.tintColor = alertTintColor
        var attributedText = NSMutableAttributedString(string: title)
        var range = NSRange(location: 0, length: attributedText.length)
        attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont(name: Constants.FontName.avenirHeavy, size: 17.0)!, range: range)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: titleColor, range: range)
        alert.setValue(attributedText, forKey: "attributedTitle")
        attributedText = NSMutableAttributedString(string: message)
        
        range = NSRange(location: 0, length: attributedText.length)
        attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont(name: Constants.FontName.avenirHeavy, size: 13.0)!, range: range)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: messageColor, range: range)
        alert.setValue(attributedText, forKey: "attributedMessage")
        self.present(alert, animated: true, completion:  nil)
    }
    
    func handleSuccess<T: Decodable> (data: Any) -> T? {
        if let data = data as? [String : Any] {
            do {
                let data = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                let decoder = JSONDecoder()
                do {
                    let data = try decoder.decode(T.self, from: data)
                    return data
                } catch let DecodingError.typeMismatch(type, context) {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.keyNotFound(key, context){
                    print("mismatch:", context.debugDescription)
                    print("key:", key)
                } catch {
                    Console.log("Parsing Error \(error)")
                }
            } catch {
                debugPrint(error.localizedDescription)
                DisplayBanner.failureBanner(message: error.localizedDescription)
            }
        } else {
            DisplayBanner.failureBanner(message: "Something went wrong".localized)
        }
        return nil
    }
    
    func handleFailure(error: Error?) {
        if let error = error {
           
         //   DisplayBanner.failureBanner(message: error.localizedDescription)
        }
    }
    
    func openMediaActionSheet(completionHandler:@escaping (_ camera:Bool,_ gallery:Bool)->()) {
        let alertController = UIAlertController(title:"Select Media".localized, message: "Please select media source".localized, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera".localized, style: .default) { (action) in
            completionHandler(true, false)
        }
        let galleryAction = UIAlertAction(title: "Gallery".localized, style: .default) { (action) in
            completionHandler(false, true)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel".localized, style: .cancel, handler: nil)
        alertController.addAction(cameraAction)
        alertController.addAction(galleryAction)
        alertController.addAction(cancelAction)
        alertController.view.tintColor = .darkGray
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String)  {
         let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
         let confirmAction = UIAlertAction(title: "ok".localized, style: .default) { (_) in
         }
         alertController.addAction(confirmAction)
         self.present(alertController, animated: true, completion: nil)
     }

     func setLeftBarButtonItem(imageName: String){
         let image =  UIImage.init(named: imageName)?.withRenderingMode(.alwaysOriginal)
         let barButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: nil)
         navigationItem.leftBarButtonItem = barButtonItem
     }
     func setRightBarButtonItem(imageName: String){
         let image =  UIImage.init(named: imageName)?.withRenderingMode(.alwaysOriginal)
         let barButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: nil)
         navigationItem.rightBarButtonItem = barButtonItem
         //navigationItem.setRightBarButton(barButtonItem, animated: true)
     }

        func presentDetail(_ viewControllerToPresent: UIViewController) {
            let transition = CATransition()
            transition.duration = 0.25
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            self.view.window!.layer.add(transition, forKey: kCATransition)

            present(viewControllerToPresent, animated: false)
        }

        func dismissDetail() {
            let transition = CATransition()
            transition.duration = 1.0
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromBottom
            self.view.window!.layer.add(transition, forKey: kCATransition)

            dismiss(animated: false)
        }
    
    func popBack(_ nb: Int) {
           if let viewControllers: [UIViewController] = self.navigationController?.viewControllers {
               guard viewControllers.count < nb else {
                   self.navigationController?.popToViewController(viewControllers[viewControllers.count - nb], animated: true)
                   return
               }
           }
       }

  
}

extension UITextField {

enum Direction {
    case Left
    case Right
}

// add image to textfield
func withImage(direction: Direction, image: UIImage, colorSeparator: UIColor, colorBorder: UIColor){
    let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
    mainView.layer.cornerRadius = 5

    let view = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
    view.backgroundColor = .white
    view.clipsToBounds = true
    view.layer.cornerRadius = 5
    view.layer.borderWidth = CGFloat(0.5)
    view.layer.borderColor = colorBorder.cgColor
    mainView.addSubview(view)

    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    imageView.frame = CGRect(x: 12.0, y: 10.0, width: 20.0, height: 20.0)
    view.addSubview(imageView)

    let seperatorView = UIView()
    seperatorView.backgroundColor = colorSeparator
    mainView.addSubview(seperatorView)

    if(Direction.Left == direction){ // image left
        seperatorView.frame = CGRect(x: 45, y: 0, width: 5, height: 45)
        self.leftViewMode = .always
        self.leftView = mainView
    } else { // image right
        seperatorView.frame = CGRect(x: 0, y: 0, width: 5, height: 45)
        self.rightViewMode = .always
        self.rightView = mainView
    }

    self.layer.borderColor = colorBorder.cgColor
    self.layer.borderWidth = CGFloat(0.5)
    self.layer.cornerRadius = 5
}

}
