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
    
    var plaatsnaam: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let query = PFQuery(className:"Slaapplek")
        // Hier zorg ik ervoor dat de plaatsnaam nooit leeg is. Ik pak de optional Plaatsnaam uit.
        // Als hij wel leeg is slaat hij de code over, zodat hij niet crasht.
        if let plaatsnaam2 = plaatsnaam {
            query.whereKey("Plaatsnaam", equalTo: plaatsnaam2)
        }
        
        
        query.findObjectsInBackgroundWithBlock {(NSArray objects, NSError error) -> Void in
            
            
            
            if error == nil {
                // Hier zorg ik ervoor dat objectes nooit leeg is. Ik pak de optional objects uit.
                // Als hij wel leeg is slaat hij de code over, zodat hij niet crasht.
                if let SlaapplekObjects = objects{
                    for Slaapplek in SlaapplekObjects {
                        // Hier set in de values uit de database in de labels.
                
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
                        }
                }
            }
            else{
            print("Error in retrieving \(error)")
            }
        }
    }
    
}
