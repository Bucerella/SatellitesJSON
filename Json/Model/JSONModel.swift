//
//  JSONModel.swift
//  Json
//
//  Created by Buse ERKUŞ on 11.04.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import Foundation

protocol JsonModelDelegate: class {
    func alert(title: String?, message: String?)
    func updateView(issLocation: Location)
}

class JSONModel: NSObject {
    weak var delegate: JsonModelDelegate?
    let url = URL(string: "https://api.wheretheiss.at/v1/satellites/25544")!
    
    func updateData() {
        let queue = DispatchQueue(label: "jsonQueue")
        queue.async {
            let task = URLSession.shared.dataTask(with: self.url) {
                data, response, error in
                
                if let error = error {
                    self.delegate?.alert(title: "Error", message: error.localizedDescription)
                    return
                }
                guard let data = data else {
                    self.delegate?.alert(title: "Error", message: "Data_Error")
                    return
                }
                do {
                    let issLocation = try JSONDecoder().decode(Location.self, from: data)
                    DispatchQueue.main.async {
                        self.delegate?.updateView(issLocation: issLocation)
                    }
                } catch {
                    self.delegate?.alert(title: "Error", message: error.localizedDescription)
                }
            }
            task.resume()
        }
    }
}
