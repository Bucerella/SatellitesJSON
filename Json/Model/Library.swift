//
//  Library.swift
//  Json
//
//  Created by Buse ERKUŞ on 11.04.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//
import UIKit

struct Location: Codable {
    let latitude: Double
    let longitude: Double
    let altitude: Double
    let velocity: Double
    let visibility: String
}

struct Library {
    static let degreeUnicode = "\u{00B0}"
    static let marginSmall = CGFloat(8.0)
    static let marginLarge = CGFloat(40.0)
    static let backgroundColor = UIColor.orange
    static let foregroundColor = UIColor.white
    
    static func activityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        return activityIndicator
    }
    
    static func alertController(title: String?, message: String?) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return alertController
    }
    
    static func label(text: String, multiplier: CGFloat, textColor:UIColor) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = label.font.withSize(15)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = textColor
        return label
    }
    
    static func navigationController(rootController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootController)
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = Library.backgroundColor
        navigationController.navigationBar.tintColor = Library.foregroundColor
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor : Library.foregroundColor]
        return navigationController
    }
    
    static func numberFormatter() -> NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.alwaysShowsDecimalSeparator = true
        return numberFormatter
    }
}
