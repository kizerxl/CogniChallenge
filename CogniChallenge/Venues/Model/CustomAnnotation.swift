//
//  MyAnnotation.swift
//  CogniChallenge
//
//  Created by Felix Changoo on 1/20/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    let cashback: Double
    let user: Double?
    
    init(with venue: Venue) {
        self.title = venue.name
        self.locationName = venue.city
        self.cashback = venue.cashback
        self.coordinate = CLLocationCoordinate2DMake(venue.lat, venue.long)
        self.user = venue.user_id
        
        super.init()
    }
    
    var subtitle: String? {
        var completeSubtitle = "Location: \(locationName.capitalized)"
        
        if let user = user {
            completeSubtitle = "\(completeSubtitle), User:\(user)"
        }
        
        return completeSubtitle
    }
}
