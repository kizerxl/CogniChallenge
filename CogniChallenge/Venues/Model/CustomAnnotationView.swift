//
//  CustomAnnotation.swift
//  CogniChallenge
//
//  Created by Felix Changoo on 1/19/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import UIKit
import MapKit

class CustomAnnotationView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let customAnnotation = newValue as? CustomAnnotation else { return }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
           
            markerTintColor = UIColor.green
            glyphText = String(customAnnotation.cashback)
        }
    }
}

