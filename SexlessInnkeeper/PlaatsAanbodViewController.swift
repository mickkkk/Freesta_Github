//
//  PlaatsAanbodViewController.swift
//  SexlessInnkeeper
//
//  Created by Fhict on 08/10/15.
//  Copyright (c) 2015 Fontys. All rights reserved.
//

import UIKit
import Parse

class PlaatsAanbodViewController: UIViewController {

    
    @IBOutlet weak var tbPlaatsnaam: UITextField!
    
    @IBOutlet weak var tbGrootte: UITextField!
    
    @IBOutlet weak var tbAantalPersonen: UITextField!
    
    @IBOutlet weak var tbOmschrijving: UITextField!
    
    @IBOutlet weak var dpDatum: UIDatePicker!
    
    @IBOutlet weak var lblAanbodToegevoegd: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblAanbodToegevoegd.hidden = true

        /*
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Object has been saved.")
        }
*/
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnPlaatsAanbod(sender: UIButton) {
        
        var textDatum = dpDatum.date
        
        let Slaapplek = PFObject(className: "Slaapplek")
        Slaapplek["Plaatsnaam"] = tbPlaatsnaam.text
        Slaapplek["Grootte"] = tbGrootte.text
        Slaapplek["AantalPersonen"] = tbAantalPersonen.text
        Slaapplek["Omschrijving"] = tbOmschrijving.text
        Slaapplek["Datum"] = textDatum
        
        
        Slaapplek.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            self.lblAanbodToegevoegd.hidden = false
        
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
