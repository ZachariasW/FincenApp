//
//  BannerManager.swift
//  HabuildIt
//
//  Created by vivek on 2024-06-10.
//

import UIKit

class BannerManager {
    
    static let shared = BannerManager()
    
    private init() {}
    
    func showBanner(message: String, type: BannerType, duration: TimeInterval = 2.0) {
        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
        
        let banner = BannerView(message: message, type: type)
        banner.translatesAutoresizingMaskIntoConstraints = false
        
        window.addSubview(banner)
        
        NSLayoutConstraint.activate([
            banner.centerXAnchor.constraint(equalTo: window.centerXAnchor),
            banner.centerYAnchor.constraint(equalTo: window.centerYAnchor),
            banner.widthAnchor.constraint(lessThanOrEqualTo: window.widthAnchor, multiplier: 0.9),
            banner.heightAnchor.constraint(greaterThanOrEqualToConstant: 100)
        ])
        
        // Initial scale to make the banner slightly smaller
        banner.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        banner.alpha = 0
        
        // Animate the banner view with scaling and bouncing effect
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 1,
                       options: .curveEaseInOut,
                       animations: {
            banner.transform = CGAffineTransform.identity
            banner.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.3,
                           delay: duration,
                           options: .curveEaseInOut,
                           animations: {
                banner.alpha = 0
            }, completion: { _ in
                banner.removeFromSuperview()
            })
        }
        
        // Add icon animation (e.g., bouncing effect)
        banner.iconImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.5,
                       delay: 0.1,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: .curveEaseInOut,
                       animations: {
            banner.iconImageView.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}
