//
//  CityTableViewCell.swift
//  simple-weather
//
//  Created by m on 02/10/2019.
//  Copyright © 2019 MSKR. All rights reserved.
//

import UIKit
import Kingfisher

class CityTableViewCell: UITableViewCell {
  
  @IBOutlet private weak var backgroundImageView: UIImageView!
  @IBOutlet private weak var nameLabel: UILabel!
  @IBOutlet private weak var temperatureLabel: UILabel!
  
  private var model: CityTableViewCellModel!
  
  func setup(model: CityTableViewCellModel) {
    self.model = model
    setupLabels()
    setupImage()
  }
  
  private func setupLabels() {
    nameLabel.textColor = UIColor.white
    nameLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .semibold)
    nameLabel.text = model.city.name
    temperatureLabel.textColor = UIColor.white
    temperatureLabel.font = UIFont.systemFont(ofSize: 31.0, weight: .semibold)
    temperatureLabel.text = "\(model.city.temperature)"
  }
  
  private func setupImage() {
    let placeholderImage = #imageLiteral(resourceName: "city_placeholder_small")
    APIManager.shared.getWallpaperUrl(cityName: model.city.name) { [weak self] (urlString, error) in
      if let url = URL(string: urlString ?? "") {
        self?.backgroundImageView.kf.setImage(with: url, placeholder: placeholderImage, options: [.forceTransition, .transition(.fade(0.2))])
      } else {
        self?.backgroundImageView.image = placeholderImage
        NSLog("🔥 Unable to download image: \(error?.localizedDescription ?? "Unknown error")")
      }
    }
  }
}
