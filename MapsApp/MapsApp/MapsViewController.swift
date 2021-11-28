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
    
    var selectedTitle = ""
    var selectedID :UUID?
    
    var annotationTitle = ""
    var annotationSubtitle = ""
    var annotationLatitude = Double()
    var annotationLongitude = Double()
    
    
    
    
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
        
        
        
        if selectedTitle != ""{
            //Fetch data
            if let uuidString = selectedID?.uuidString{
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Place")
                fetchRequest.predicate = NSPredicate(format: "id = %@", uuidString)
                fetchRequest.returnsObjectsAsFaults = false
                
                
                do{
                    let results = try context.fetch(fetchRequest)
                    
                    if results.count > 0{
                        for item in results as! [NSManagedObject]{
                            
                            if let titleFromCoreData = item.value(forKey: "title") as? String{
                                annotationTitle = titleFromCoreData
                                if let describtionFromCoreData = item.value(forKey: "describtion") as? String{
                                    annotationSubtitle = describtionFromCoreData
                                    if let latitudeFromCoreData = item.value(forKey: "latitude") as? Double{
                                        annotationLatitude = latitudeFromCoreData
                                        if let longitudeFromCoreData = item.value(forKey: "longitude") as? Double{
                                            annotationLongitude = longitudeFromCoreData
                                            
                                            
                                            let annotation = MKPointAnnotation()
                                            annotation.title = annotationTitle
                                            annotation.subtitle = annotationSubtitle
                                            let coordinate = CLLocationCoordinate2D(latitude: annotationLatitude, longitude: annotationLongitude)
                                            annotation.coordinate = coordinate
                                            mapView.addAnnotation(annotation)
                                            titleTextView.text = annotationTitle
                                            describtionTextView.text = annotationSubtitle
                                            
                                            locationManager.stopUpdatingLocation()
                                            let span = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
                                            let region = MKCoordinateRegion(center: coordinate, span: span)
                                            
                                            mapView.setRegion(region, animated: true)
                                            
                                        }
                                    }
                                }
                            }
                            
                        }
                    }
                } catch{
                    print("fail when fetch with uuid")
                }
            }
            
            
            
            
        }else{
            // Adding new Data
            
        }
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
        
        if selectedTitle == ""{
            let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
            let region = MKCoordinateRegion(center: location, span: span)
            
            mapView.setRegion(region, animated: true)
        }
        
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

