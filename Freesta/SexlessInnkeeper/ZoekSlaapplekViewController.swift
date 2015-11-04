//
//  ZoekSlaapplekViewController.swift
//  SexlessInnkeeper
//
//  Created by Fhict on 08/10/15.
//  Copyright (c) 2015 Fontys. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Parse

class ZoekSlaapplekViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var tbPlaatsnaam: UITextField!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func btnZoekSlaapplek(sender: UIButton) {
    }
    
    @IBAction func btnSlaapplekAanbieden(sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
        // hier laat ik de locatie van de user in de mapview zien.
        self.mapView.showsUserLocation = true
        
        // het set ik de locaties van de pointannotations.
        let locationKamer1 = CLLocationCoordinate2DMake(51.44963,5.47972)
        
        let locationKamer2 = CLLocationCoordinate2DMake(51.45756, 5.47199)
        
        let locationKamer3 = CLLocationCoordinate2DMake(51.43715, 5.46121)
        
        let locationKamer4 = CLLocationCoordinate2DMake(51.43968, 5.48374)
        
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = locationKamer1
        annotation1.title = "Slaapplek voor 2 personen"
        annotation1.subtitle = "Loondermolen 32"
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = locationKamer2
        annotation2.title = "Slaapplek in hartje Eindhoven"
        annotation2.subtitle = "Europalaan 4"
        
        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = locationKamer3
        annotation3.title = "Slaapplek aangeboden!"
        annotation3.subtitle = "Jacobus Deckersstraat 109"
        
        let annotation4 = MKPointAnnotation()
        annotation4.coordinate = locationKamer4
        annotation4.title = "Kamer in Eindhoven"
        annotation4.subtitle = "Tramstraat 52"
        
        mapView.addAnnotation(annotation1)
        mapView.addAnnotation(annotation2)
        mapView.addAnnotation(annotation3)
        mapView.addAnnotation(annotation4)

        // Zorgt ervoor dat alles opschruift als het keyboard enabled wordt
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta:0.08, longitudeDelta:0.08))
        
        self.mapView.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Errors: " + error.localizedDescription)
    }
    
    //Hiermee geef ik de plaatsnaam mee naar de volgende view (resultaatViewController)
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "SegueResultaat"){
            let svc = segue.destinationViewController as! ResultaatViewController
            svc.plaatsnaam = tbPlaatsnaam.text
        }
    }
    
    // Zorgt ervoor dat alles opschruift als het keyboard enabled wordt
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.view.frame.origin.y -= keyboardSize.height
        }
    }
    // Zorgt ervoor dat alles opschruift als het keyboard enabled wordt
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.view.frame.origin.y += keyboardSize.height
        }
    }

}
