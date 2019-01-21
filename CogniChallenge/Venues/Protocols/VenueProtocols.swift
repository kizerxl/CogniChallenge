//
//  VenueProtocols.swift
//  CogniChallenge
//
//  Created by Felix Changoo on 1/19/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import UIKit

protocol VenueViewDelegate {
    func displayVenues()
    func onDisplayVenues(venues: [Venue])
}

protocol VenueServiceProtocol {
    typealias completion = ([Venue]) -> ()
    
    func getVenues(endpoint: String, token: String, city: String?, with completionHandler: @escaping completion)
}
