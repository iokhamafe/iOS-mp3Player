//
//  ArtistLocationViewController.swift
//  PAFinalOkhamafe
//
//  Created by Lamido Tijjo on 5/16/16.
//  Copyright © 2016 Mafe. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ArtistLocationViewController: UIViewController {
    var theArtist:Artist!
    @IBOutlet var artistMap: MKMapView!
    
    let latDelta: CLLocationDegrees = 0.05
    let longiDelta: CLLocationDegrees = 0.05
    
    var artistSpan:MKCoordinateSpan? {
       return MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longiDelta)
    }
    
    var artistRegion:MKCoordinateRegion {
        return MKCoordinateRegion(center: theArtist.artistLocation , span: artistSpan!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artistMap.setRegion(artistRegion, animated: false)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
