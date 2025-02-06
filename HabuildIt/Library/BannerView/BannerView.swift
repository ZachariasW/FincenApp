//
//  BannerView.swift
//  HabuildIt
//
//  Created by vivek on 2024-06-10.
//

import UIKit

enum BannerType {
    case success
    case error
    
    var backgroundColor: UIColor {
        switch self {
        case .success:
            return UIColor(red: 0.0, green: 0.5, blue: 0.0, alpha: 0.8) // Dark green
        case .error:
            return UIColor.red.withAlphaComponent(0.8)
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .success:
            return UIImage(systemName: "checkmark.circle.fill")
        case .error:
            return UIImage(systemName: "xmark.circle.fill")
        }
    }
}

class BannerView: UIView {
    
    private let messageLabel = UILabel()
     let iconImageView = UIImageView()
    
    init(message: String, type: BannerType) {
        super.init(frame: .zero)
        setupView(type: type)
        messageLabel.text = message
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(type: BannerType) {
        // Configure the banner view
        backgroundColor = type.backgroundColor
        layer.cornerRadius = 12
        layer.masksToBounds = true
        
        // Configure the icon image view
        iconImageView.image = type.icon
        iconImageView.tintColor = .white
        iconImageView.contentMode = .scaleAspectFit
        
        // Configure the message label
        messageLabel.textColor = .white
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        // Add the icon image view and message label to the banner view
        addSubview(iconImageView)
        addSubview(messageLabel)
        
        // Setup constraints for the icon image view
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 40),
            iconImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Setup constraints for the message label
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}
