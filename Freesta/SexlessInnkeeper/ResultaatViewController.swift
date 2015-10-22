//
//  ResultaatViewController.swift
//  SexlessInnkeeper
//
//  Created by Fhict on 21/10/15.
//  Copyright (c) 2015 Fontys. All rights reserved.
//

import UIKit
import Parse

class ResultaatViewController: UIViewController {

    
    
    @IBOutlet weak var lblPlaatsnaam1: UILabel!
    
    @IBOutlet weak var lblGrootte1: UILabel!
    
    @IBOutlet weak var lblAantalPersonen1: UILabel!
    
    @IBOutlet weak var lblOmschrijving1: UILabel!
    
    @IBOutlet weak var nbTitel: UINavigationItem!
    
    var plaatsnaam: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        /*
        if let SlaapplekObjects = objects as? [PFObject] {
            for Slaapplek in SlaapplekObjects {
            // Use staff as a standard PFObject now. e.g.
            let plaatsnaam = Slaapplek.objectForKey("Plaatsnaam")
            }
        }

        
*/
        
        nbTitel.title = plaatsnaam
        
        let query = PFQuery(className:"Slaapplek")
        query.whereKey("Plaatsnaam", equalTo: plaatsnaam)
        query.findObjectsInBackgroundWithBlock {(NSArray objects, NSError error) -> Void in
            
            
            
            if error == nil {
                //var i : Int = 1
                // The find succeeded.
                //print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                // if let SlaapplekObjects = objects as? [PFObject]! {
                if let SlaapplekObjects = objects{
                    for Slaapplek in SlaapplekObjects {
                
                        let plaatsnaamLet = Slaapplek.objectForKey("Plaatsnaam")
                        let plaatsnaamString:String = plaatsnaamLet as! String
                        self.lblPlaatsnaam1.text = plaatsnaamString
        
                        let grootteLet = Slaapplek.objectForKey("Grootte")
                        let grootteString:String = grootteLet as! String
                        self.lblGrootte1.text = grootteString
                        
                        let aantalPersonenLet = Slaapplek.objectForKey("AantalPersonen")
                        let aantalPersonenString:String = aantalPersonenLet as! String
                        self.lblAantalPersonen1.text = aantalPersonenString
                        
                        let omschrijvingLet = Slaapplek.objectForKey("Omschrijving")
                        let omschrijvingString:String = omschrijvingLet as! String
                        self.lblOmschrijving1.text = omschrijvingString
                        
                        /*
                        let datumLet = Slaapplek.objectForKey("Datum")
                        var datumString:String = datumLet as String
                        self.lblDatum1.text = datumString
                        */

                    }
                }
            }
            else{
            print("Error in retrieving \(error)")
            }
        }


        /*
        
        var query = PFQuery(className:"GameScore")
        query.whereKey("playerName", equalTo:"Sean Plott")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        self.lblResultaat.text == object["Plaatsnaam"] as String!
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo!)")
            }
        }
*/
    }
    
}
