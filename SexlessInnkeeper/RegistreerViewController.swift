//
//  RegistreerViewController.swift
//  SexlessInnkeeper
//
//  Created by Fhict on 02/10/15.
//  Copyright (c) 2015 Fontys. All rights reserved.
//

import UIKit
import Parse

class RegistreerViewController: UIViewController {

    @IBOutlet weak var tbGebruikersnaam: UITextField!
    
    @IBOutlet weak var tbWachtwoord: UITextField!
    
    @IBOutlet weak var tbHerhaalWachtwoord: UITextField!
    
    @IBOutlet weak var tbNaam: UITextField!
    
    @IBOutlet weak var tbWoonplaats: UITextField!
    
    @IBOutlet weak var tbLeeftijd: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnRegistreer(sender: UIButton) {
    }

    @IBAction func btnLogin(sender: UIButton) {
        self.dismissViewControllerAnimated(true , completion: nil)
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
