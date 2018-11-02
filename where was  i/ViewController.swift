//
//  ViewController.swift
//  where was  i
//
//  Created by Travlr-yuda on 11/1/18.
//  Copyright © 2018 Travlr-yuda. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    @IBAction func SaveButtonClicked(_ sender: Any) {
        let coord = locationManager.location?.coordinate
        
        if let lat  = coord?.latitude{
            if let long = coord?.longitude{
                DataStore().StoreDataPoint(latitude: String(lat), longitude: String(long))
            }
        }
       
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else{
            print("Location not enabled")
            return
        }
        
        print("Location Allowed")
        mapView.showsUserLocation = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

