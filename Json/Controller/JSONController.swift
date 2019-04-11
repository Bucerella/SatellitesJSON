//
//  JSONController.swift
//  Json
//
//  Created by Buse ERKUŞ on 11.04.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import Foundation
import UIKit

class JSONController: UIViewController, JSONModelDelegate {
    let jsonView = JSONView()
    let jsonModel = JSONModel()
    let numberFormatter = Library.numberFormatter()
    var timer: Timer!
    
    override func loadView() {
        super.loadView()
        title = "International Space Station"
        view = jsonView
        jsonModel.delegate = self
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.jsonModel.updateData()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer.invalidate()
    }
    
    func updateView(issLocation: Location) {
        jsonView.activityIndicator.color = .clear
        jsonView.latitudeKey.textColor = Library.foregroundColor
        jsonView.latitudeValue.text = String(format: "%@ %@", self.numberFormatter.string(for: issLocation.latitude)!, Library.degreeUnicode)
        
        jsonView.longitudeKey.textColor = Library.foregroundColor
        jsonView.longitudeValue.text = String(format: "%@ %@", self.numberFormatter.string(for: issLocation.longitude)!, Library.degreeUnicode)
        
        jsonView.altitudeKey.textColor = Library.foregroundColor
        jsonView.altitudeValue.text = String(format: "%@ km", self.numberFormatter.string(for: issLocation.altitude)!)
        
        jsonView.velocityKey.textColor = Library.foregroundColor
        jsonView.velocityValue.text = String(format: "%@ kph", self.numberFormatter.string(for: issLocation.velocity)!)
        
        jsonView.visibilityKey.textColor = Library.foregroundColor
        jsonView.visibilityValue.text = issLocation.visibility
    }
    
    func alert(title: String?, message: String?) {
        self.present(Library.alertController(title: title, message: message), animated: true, completion: nil)
    }
}
