//
//  ViewController.swift
//  MapsApp
//
//  Created by İbrahim Demirci on 28.11.2021.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController ,MKMapViewDelegate, CLLocationManagerDelegate{
    
    var locationManager = CLLocationManager()
    

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let gestureRecog = UILongPressGestureRecognizer(target: self, action: #selector(addMarker(gestureRecognizer: )))
        gestureRecog.minimumPressDuration = 2
        mapView.addGestureRecognizer(gestureRecog)
    }
    
    
    @objc func addMarker(gestureRecognizer : UILongPressGestureRecognizer){
        if gestureRecognizer.state == .began{
            let touchedLocation = gestureRecognizer.location(in: mapView)
            let touchedCoordinate = mapView.convert(touchedLocation, toCoordinateFrom: mapView)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchedCoordinate
            annotation.title = "Selected"
            annotation.subtitle = "Sample Subtitle"
            mapView.addAnnotation(annotation)
            
        }
        
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print(locations[0].coordinate.latitude)
//        print(locations[0].coordinate.longitude)

        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
    }
    
    


}

