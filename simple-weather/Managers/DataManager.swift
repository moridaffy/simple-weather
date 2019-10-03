//
//  DataManager.swift
//  simple-weather
//
//  Created by m on 02/10/2019.
//  Copyright © 2019 MSKR. All rights reserved.
//

import Foundation

class DataManager {
  
  static let shared = DataManager()
  
  private struct Keys {
    static let cityTemperature: String = "ru.mskr.simple-weather.cityTemperature_"
  }
  
  func getCachedTemperature(for city: City) -> Int? {
    return UserDefaults.standard.value(forKey: Keys.cityTemperature + city.name) as? Int
  }
  
  func saveCachedTemperature(for city: City, temperature: Int?) {
    UserDefaults.standard.setValue(temperature, forKey: Keys.cityTemperature + city.name)
  }
}
