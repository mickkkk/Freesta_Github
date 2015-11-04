//
//  BeoordelingSlaapplek.swift
//  SexlessInnkeeper
//
//  Created by Fhict on 02/10/15.
//  Copyright (c) 2015 Fontys. All rights reserved.
//

import Foundation
import Parse

class BeoordelingSlaapplek : Beoordeling
{
    var accountBeoordelaar:Int32
    var beoordeeldSlaapplek:Int32
    
    init(beoordelingsNr:Int32, datumBeoordeling:datum, aantalSterren:Int32, omschrijving:String, accountBeoordelaar:Int32, beoordeeldSlaapplek:Int32)
    {
        self.accountBeoordelaar = accountBeoordelaar
        self.beoordeeldSlaapplek = beoordeeldSlaapplek
        
        super.init(beoordelingsNr:beoordelingsNr, datumBeoordeling: datumBeoordeling, aantalSterren:aantalSterren, omschrijving:omschrijving)
    }
}