//
//  Venue.swift
//  CogniChallenge
//
//  Created by Felix Changoo on 1/19/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import UIKit

struct VenueResult: Codable {
    var venues: [Venue]
}

struct Venue: Codable {
    var name: String
    var city: String
    var cashback: Double
    var lat: Double
    var long: Double
    var user_id: Double?
}
