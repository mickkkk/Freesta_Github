//
//  Slaapplek.swift
//  SexlessInnkeeper
//
//  Created by Fhict on 02/10/15.
//  Copyright (c) 2015 Fontys. All rights reserved.
//

import Foundation
import Parse

class Slaapplek
{
    var slaapplekNr:Int32
    var accountNr:Int32
    var plaats:String
    var grootteInMeters:Int32?
    var aantalPersonen:Int32
    var omschrijving:String?
    var datumAankomst: datum
    
    init(slaapplekNr:Int32, accountNr:Int32, plaats:String, grootteInMeters:Int32, aantalPersonen:Int32, omschrijving:String, datumAankomst:datum)
    {
        self.slaapplekNr = slaapplekNr
        self.accountNr = accountNr
        self.plaats = plaats
        self.grootteInMeters = grootteInMeters
        self.aantalPersonen = aantalPersonen
        self.omschrijving = omschrijving
        self.datumAankomst = datumAankomst
    }
}