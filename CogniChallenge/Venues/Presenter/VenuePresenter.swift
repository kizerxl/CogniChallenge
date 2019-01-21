//
//  VenuePresenter.swift
//  CogniChallenge
//
//  Created by Felix Changoo on 1/19/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import UIKit

class VenuePresenter {
    var view: VenueViewDelegate
    var service: VenueServiceProtocol
    
    init(view: VenueViewDelegate, service: VenueServiceProtocol) {
        self.view = view
        self.service = service
    }
    
    func getVenues(token: String) {
        let venuesEndpoint = Endpoints.Venues.get.url
        
        service.getVenues(endpoint: venuesEndpoint, token: token, city: "New York") { [weak self] venues in
            guard let strongSelf = self else { return }
            
            strongSelf.view.onDisplayVenues(venues: venues)
        }
    }
}
