//
//  City.swift
//  simple-weather
//
//  Created by m on 02/10/2019.
//  Copyright © 2019 MSKR. All rights reserved.
//

class City {
  let name: String
  var imageUrl: String?
  var temperature: Int? {
    didSet {
      print("didSet temperature for \(name)")
      DataManager.shared.saveCachedTemperature(for: self, temperature: temperature)
    }
  }
  
  init(name: String) {
    self.name = name
    self.temperature = DataManager.shared.getCachedTemperature(for: self)
  }
}
