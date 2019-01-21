//
//  VenuesVC.swift
//  CogniChallenge
//
//  Created by Felix Changoo on 1/19/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import UIKit
import MapKit

class VenuesVC: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    var user: User?
    var venuePresenter: VenuePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        displayVenues()
    }
    
    func setupView() {
        mapView.delegate = self
        let service = VenueService()
        let coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2DMake(40.7276, -74.0067), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.register(CustomAnnotationView.self,
                         forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        venuePresenter = VenuePresenter(view: self, service: service)
    }
}

extension VenuesVC: VenueViewDelegate {
    func displayVenues() {
        if let token = user?.token {
            venuePresenter.getVenues(token: token)
        }
    }
    
    func onDisplayVenues(venues: [Venue]) {
        let annotations = venues.compactMap { CustomAnnotation(with: $0) }
        mapView.addAnnotations(annotations)
    }
}

extension VenuesVC: MKMapViewDelegate {}
