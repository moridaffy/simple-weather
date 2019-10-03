//
//  CityInfoViewController.swift
//  simple-weather
//
//  Created by m on 02/10/2019.
//  Copyright © 2019 MSKR. All rights reserved.
//

import UIKit
import Kingfisher

class CityInfoViewController: UIViewController {
  
  @IBOutlet private weak var cityImageView: UIImageView!
  @IBOutlet private weak var cityTemperatureLabel: UILabel!
  
  private var model: CityInfoViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  func setup(model: CityInfoViewModel) {
    self.model = model
  }
  
  private func setupUI() {
    title = model.city.name
    
    let placeholderImage = #imageLiteral(resourceName: "city_placeholder_small")
    cityImageView.kf.setImage(with: URL(string: model.city.imageUrl ?? ""), placeholder: placeholderImage, options: [.forceTransition, .transition(.fade(0.2))])
    
    if let temperature = model.city.temperature {
      cityTemperatureLabel.textColor = UIColor.black
      cityTemperatureLabel.font = UIFont.systemFont(ofSize: 50.0, weight: .semibold)
      cityTemperatureLabel.text = "\(temperature)°"
    } else {
      cityTemperatureLabel.textColor = UIColor.gray
      cityTemperatureLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .regular)
      cityTemperatureLabel.text = "Ooops... Something went wrong :^("
    }
  }
}
