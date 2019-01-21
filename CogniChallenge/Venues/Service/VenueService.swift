//
//  VenueService.swift
//  CogniChallenge
//
//  Created by Felix Changoo on 1/19/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import UIKit

class VenueService: VenueServiceProtocol {
    func getVenues(endpoint: String, token: String, city: String?, with completionHandler: @escaping completion) {
        let urlComponents = NSURLComponents(string: endpoint)!
        
        if let city = city {
            urlComponents.queryItems = [
                NSURLQueryItem(name: "city", value: "\(city)")
            ] as [URLQueryItem]
        }
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(token, forHTTPHeaderField: "Token")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler([])
                return
            }
            
            let decoder = JSONDecoder()
            let venues = try? decoder.decode(VenueResult.self, from: data).venues
            
            if let venues = venues {
                completionHandler(venues)
            } else {
                completionHandler([])
            }
            
        }
        
        task.resume()
    }
}

