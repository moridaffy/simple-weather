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
  @IBOutlet private weak var cityNameLabel: UILabel!
  @IBOutlet private weak var cityTemperatureLabel: UILabel!
  
  private var model: CityInfoViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func setup(model: CityInfoViewModel) {
    self.model = model
  }
  
  private func setupUI() {
    cityImageView.kf.setImage(with: URL(string: model.city.imageUrl ?? ""), placeholder: nil, options: [])
  }
}
