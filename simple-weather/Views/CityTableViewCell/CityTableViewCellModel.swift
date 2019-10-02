//
//  CityTableViewCellModel.swift
//  simple-weather
//
//  Created by m on 02/10/2019.
//  Copyright © 2019 MSKR. All rights reserved.
//

class CityTableViewCellModel {
  
  let city: City
  weak var view: CityTableViewCell?
  
  init(city: City) {
    self.city = city
  }
  
}
