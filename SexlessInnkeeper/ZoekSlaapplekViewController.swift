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
    
    @IBOutlet weak var lblAdres: UILabel!
    
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
        
        self.mapView.showsUserLocation = true
        
        //var locationFontys = CLLocationCoordinate2DMake(51.45169,5.48160)
        
        let locationKamer1 = CLLocationCoordinate2DMake(51.44963,5.47972)
        
        let locationKamer2 = CLLocationCoordinate2DMake(51.45756, 5.47199)
        
        let locationKamer3 = CLLocationCoordinate2DMake(51.43715, 5.46121)
        
        let locationKamer4 = CLLocationCoordinate2DMake(51.43968, 5.48374)
        
        //var span = MKCoordinateSpanMake(0.08, 0.08)
        
        //var region = MKCoordinateRegion(center: locationFontys, span: span)
        
        //mapView.setRegion(region, animated: true)
        
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = locationKamer1
        annotation1.title = "Title 1"
        annotation1.subtitle = "Subtitle 1"
        
        /*
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        var button1 = UIButton.buttonWithType(UIButtonType.DetailDisclosure) as UIButton // button with info sign in it
        pinView?.rightCalloutAccessoryView = button1
        */
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = locationKamer2
        annotation2.title = "Title 2"
        annotation2.subtitle = "Subtitle 2"
        
        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = locationKamer3
        annotation3.title = "Title1 3"
        annotation3.subtitle = "Subtitle3"
        
        let annotation4 = MKPointAnnotation()
        annotation4.coordinate = locationKamer4
        annotation4.title = "Title 4"
        annotation4.subtitle = "Subtitle 4"
        
        mapView.addAnnotation(annotation1)
        mapView.addAnnotation(annotation2)
        mapView.addAnnotation(annotation3)
        mapView.addAnnotation(annotation4)



        
    }
    
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseId = "pin"
        var view = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
        if view == nil {
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            view?.canShowCallout = true
            //var button = UIButton.buttonWithType(UIButtonType.DetailDisclosure) as UIButton // button with info sign in it
            
            //view.rightCalloutAccessoryView = button
            
            view?.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure)
        } else {
            view?.annotation = annotation
        }
        return view
    }
    
    var selectedAnnotation: MKPointAnnotation!
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            selectedAnnotation = view.annotation as? MKPointAnnotation
            performSegueWithIdentifier("InformationButton", sender: self)
        }
    }
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? SecondViewController {
            destination.annotation = selectedAnnotation
        }
    }
    */
    
    
    
    
    /*
    // Here we add disclosure button inside annotation window
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        println("viewForannotation")
        if annotation is MKUserLocation {
            //return nil
            return nil
        }
        
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        
        if pinView == nil {
            //println("Pinview was nil")
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.animatesDrop = true
        }
        
        var button = UIButton.buttonWithType(UIButtonType.DetailDisclosure) as UIButton // button with info sign in it
        
        pinView?.rightCalloutAccessoryView = button
        
        
        return pinView
    }
   */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        //var locationFontys = CLLocationCoordinate2DMake(51.45169,5.48160)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta:0.08, longitudeDelta:0.08))
        
        //let region = MKCoordinateRegion(center: locationFontys, span: MKCoordinateSpan(latitudeDelta:0.08, longitudeDelta:0.08))
        
        self.mapView.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Errors: " + error.localizedDescription)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "SegueResultaat"){
            let svc = segue.destinationViewController as! ResultaatViewController
            svc.plaatsnaam = tbPlaatsnaam.text
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
