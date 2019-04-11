//
//  JSONView.swift
//  Json
//
//  Created by Buse ERKUŞ on 11.04.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import UIKit

class JSONView: UIView {
    
    let activityIndicator = Library.activityIndicator()
    let latitudeKey = Library.label(text: "Latitude", multiplier: 1.5, textColor: .clear)
    let latitudeValue = Library.label(text: "", multiplier: 1.1, textColor: .black)
    let longitudeKey = Library.label(text: "Longitude", multiplier: 1.5, textColor: .clear)
    let longitudeValue = Library.label(text: "", multiplier: 1.1, textColor: .black)
    let altitudeKey = Library.label(text: "Altitude", multiplier: 1.5, textColor: .clear)
    let altitudeValue = Library.label(text: "", multiplier: 1.1, textColor: .black)
    let velocityKey = Library.label(text: "Velocity", multiplier: 1.5, textColor: .clear)
    let velocityValue = Library.label(text: "", multiplier: 1.1, textColor: .black)
    let visibilityKey = Library.label(text: "Visibility", multiplier: 1.5, textColor: .clear)
    let visibilityValue = Library.label(text: "", multiplier: 1.1, textColor: .black)
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    func initialize() {
        self.backgroundColor = Library.backgroundColor
        let layoutGuide = UILayoutGuide()
        self.addLayoutGuide(layoutGuide)
        let margins = self.layoutMarginsGuide
        NSLayoutConstraint.activate([
            layoutGuide.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            layoutGuide.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            layoutGuide.topAnchor.constraint(equalTo: margins.topAnchor, constant: Library.marginSmall),
            layoutGuide.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -Library.marginLarge)])
        
        self.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor),
            activityIndicator.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: Library.marginLarge)])
        
        self.addSubview(latitudeKey)
        NSLayoutConstraint.activate([
            latitudeKey.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor),
            latitudeKey.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: Library.marginLarge+40.0)])
        
        self.addSubview(latitudeValue)
        NSLayoutConstraint.activate([
            latitudeValue.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor),
            latitudeValue.topAnchor.constraint(equalTo: latitudeKey.bottomAnchor, constant: Library.marginSmall)])
        
        self.addSubview(longitudeKey)
        NSLayoutConstraint.activate([
            longitudeKey.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor),
            longitudeKey.topAnchor.constraint(equalTo: latitudeValue.bottomAnchor, constant: Library.marginLarge)])
        
        self.addSubview(longitudeValue)
        NSLayoutConstraint.activate([
            longitudeValue.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor),
            longitudeValue.topAnchor.constraint(equalTo: longitudeKey.bottomAnchor, constant: Library.marginSmall)])
        
        self.addSubview(altitudeKey)
        NSLayoutConstraint.activate([
            altitudeKey.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor),
            altitudeKey.topAnchor.constraint(equalTo: longitudeValue.bottomAnchor, constant: Library.marginLarge)])
        
        self.addSubview(altitudeValue)
        NSLayoutConstraint.activate([
            altitudeValue.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor),
            altitudeValue.topAnchor.constraint(equalTo: altitudeKey.bottomAnchor, constant: Library.marginSmall)])
        
        self.addSubview(velocityKey)
        NSLayoutConstraint.activate([
            velocityKey.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor),
            velocityKey.topAnchor.constraint(equalTo: altitudeValue.bottomAnchor, constant: Library.marginLarge)])
        
        self.addSubview(velocityValue)
        NSLayoutConstraint.activate([
            velocityValue.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor),
            velocityValue.topAnchor.constraint(equalTo: velocityKey.bottomAnchor, constant: Library.marginSmall)])
        
        self.addSubview(visibilityKey)
        NSLayoutConstraint.activate([
            visibilityKey.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor),
            visibilityKey.topAnchor.constraint(equalTo: velocityValue.bottomAnchor, constant: Library.marginLarge)])
        
        self.addSubview(visibilityValue)
        NSLayoutConstraint.activate([
            visibilityValue.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor),
            visibilityValue.topAnchor.constraint(equalTo: visibilityKey.bottomAnchor, constant: Library.marginSmall)])
    }
}
