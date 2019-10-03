//
//  APIManager.swift
//  simple-weather
//
//  Created by m on 02/10/2019.
//  Copyright © 2019 MSKR. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
  
  static let shared = APIManager()
  
  private struct Keys {
    static let openWeatherMapKey: String = "88f5b4ccbc1dcb5bb1d5a3e8d4ea49e3"
    static let pixabayKey: String = "11593239-2231be4e9960749d8245a85f7"
  }
  
  private struct URLs {
    static let pixabayBaseUrl: String = "https://pixabay.com/api"
    static let openWeatherMapBaseUrl: String = "https://api.openweathermap.org/data/2.5/weather"
  }
  
  func getTemperature(cityName: String, completion: @escaping (Int?, Error?) -> Void) {
    let urlString = URLs.openWeatherMapBaseUrl + "?appid=\(Keys.openWeatherMapKey)" + "&q=\(cityName)" + "&units=metric"
    guard let url = URL(string: urlString) else { fatalError() }
    
    AF.request(url).responseJSON { (response) in
      guard let data = response.data,
            let openWeatherMapResponse = try? JSONDecoder().decode(OpenWeatherMapCodable.self, from: data) else {
        completion(nil, response.error)
        return
      }
      
      let temperature = Int(openWeatherMapResponse.main.temp)
      completion(temperature, response.error)
    }
  }
  
  func getWallpaperUrl(cityName: String, completion: @escaping (String?, Error?) -> Void) {
    let urlString = URLs.pixabayBaseUrl + "?key=\(Keys.pixabayKey)" + "&q=\(cityName)+night" + "&image_type=photo"
    guard let url = URL(string: urlString) else { fatalError() }
    
    AF.request(url).responseJSON { (response) in
      guard let data = response.data,
            let pixabayResponse = try? JSONDecoder().decode(PixabayCodable.self, from: data) else {
        completion(nil, response.error)
        return
      }
      
      let imageUrl = pixabayResponse.hits.first?.webformatURL
      completion(imageUrl, response.error)
    }
  }
}
