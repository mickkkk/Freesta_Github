//
//  Beoordeling.swift
//  SexlessInnkeeper
//
//  Created by Fhict on 02/10/15.
//  Copyright (c) 2015 Fontys. All rights reserved.
//

import Foundation
import Parse

class Beoordeling
{
    var beoordelingsNr:Int32
    var datumBeoordeling:datum
    var aantalSterren:Int32
    var omschrijving:String
    
    init(beoordelingsNr:Int32, datumBeoordeling:datum, aantalSterren:Int32, omschrijving:String)
    {
        self.beoordelingsNr = beoordelingsNr
        self.datumBeoordeling = datumBeoordeling
        self.aantalSterren = aantalSterren
        self.omschrijving = omschrijving
    }
}