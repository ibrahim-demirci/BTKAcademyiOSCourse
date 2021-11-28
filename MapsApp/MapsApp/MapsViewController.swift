//
//  ViewController.swift
//  MapsApp
//
//  Created by İbrahim Demirci on 28.11.2021.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class MapsViewController: UIViewController ,MKMapViewDelegate, CLLocationManagerDelegate{
    
    var locationManager = CLLocationManager()
    

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var titleTextView: UITextField!
    @IBOutlet weak var describtionTextView: UITextField!
    
    var selectedLatitude = Double()
    var selectedLongitude = Double()
    
    
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
            
            
            selectedLatitude = touchedCoordinate.latitude
            selectedLongitude = touchedCoordinate.longitude
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchedCoordinate
            annotation.title = titleTextView.text
            annotation.subtitle = describtionTextView.text
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
    
    
    @IBAction func save(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Place", into: context)
        
        newPlace.setValue(titleTextView.text, forKey:"title" )
        newPlace.setValue(describtionTextView.text, forKey: "describtion")
        newPlace.setValue(selectedLatitude, forKey: "latitude")
        newPlace.setValue(selectedLongitude, forKey: "longitude")
        newPlace.setValue(UUID(), forKey: "id")
        
        
        do{
            try context.save()
            print("saved")
            
        } catch{
            print("error when save")
        }
        
        
    }
    

}

