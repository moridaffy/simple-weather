//
//  City.swift
//  simple-weather
//
//  Created by m on 02/10/2019.
//  Copyright © 2019 MSKR. All rights reserved.
//

class City {
  let id: String
  let name: String
  let temperature: Int
  let imageUrl: String?
  
  init(id: String, name: String, temperature: Int, imageUrl: String?) {
    self.id = id
    self.name = name
    self.temperature = temperature
    self.imageUrl = imageUrl
  }
}
