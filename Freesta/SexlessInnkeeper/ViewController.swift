//
//  ViewController.swift
//  SexlessInnkeeper
//
//  Created by Fhict on 01/10/15.
//  Copyright (c) 2015 Fontys. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var lblGebruikersnaam: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Object has been saved.")
        }
        */
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.performSegueWithIdentifier("GO_TO_LOGIN", sender: self)
    }

    @IBAction func btnLogOut(sender: UIButton) {
        self.performSegueWithIdentifier("GO_TO_LOGIN", sender: self)
    }
    

}

