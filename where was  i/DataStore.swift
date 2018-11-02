//
//  DataStore.swift
//  where was  i
//
//  Created by Travlr-yuda on 11/3/18.
//  Copyright © 2018 Travlr-yuda. All rights reserved.
//

import Foundation

struct StorageKeys {
    
    static let storedLat = "storedLat"
    static let storedLong = "storedLong"
    
}

class DataStore {
    func GetDefaults() -> UserDefaults {
        return UserDefaults.standard
    }
    func StoreDataPoint(latitude:String, longitude:String) {
        let def = GetDefaults()
        
        def.setValue(latitude, forKey: StorageKeys.storedLat)
        def.setValue(longitude, forKey: StorageKeys.storedLong)
        
        def.synchronize()
        
        print(latitude + " : " + longitude)
    }
    func GetLastLocation() -> VisitedPoint? {
        let defaults = GetDefaults()
        
        if let lat = defaults.string(forKey: StorageKeys.storedLat){
            if let long = defaults.string(forKey: StorageKeys.storedLong){
                return VisitedPoint(lat: lat, long: long)
            }
        }
        
        return nil
    }
}
