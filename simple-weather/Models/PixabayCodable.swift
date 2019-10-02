//
//  PixabayCodable.swift
//  simple-weather
//
//  Created by m on 02/10/2019.
//  Copyright © 2019 MSKR. All rights reserved.
//

import Foundation

struct PixabayCodable: Codable {
  let hits: [PixabayImageCodable]
}
