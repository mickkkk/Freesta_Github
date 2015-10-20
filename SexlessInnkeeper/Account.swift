//
//  Account.swift
//  SexlessInnkeeper
//
//  Created by Fhict on 02/10/15.
//  Copyright (c) 2015 Fontys. All rights reserved.
//

import Foundation
import Parse

class Account
{
    var accountNr:Int32
    var gebruikersnaam: String
    var wachtwoord: String
    var naam:String?
    var woonplaats:String?
    var leeftijd:Int32?
    var lidSinds:datum?
    var punten:Int32?
    var aantalSterren:Int32?
    
    init(accountNr:Int32, gebruikersnaam:String, wachtwoord:String, naam:String, woonplaats:String, leeftijd:Int32, lidSinds:datum, punten:Int32, aantalSterren:Int32)
    {
        //self.name = name!
        self.accountNr = accountNr
        self.gebruikersnaam = gebruikersnaam
        self.wachtwoord = wachtwoord
        self.naam = naam
        self.woonplaats = woonplaats
        self.leeftijd = leeftijd
        self.lidSinds = lidSinds
        self.punten = punten
        self.aantalSterren = aantalSterren
    }
}