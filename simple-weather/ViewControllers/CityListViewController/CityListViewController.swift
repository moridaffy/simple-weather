//
//  CityListViewController.swift
//  simple-weather
//
//  Created by m on 02/10/2019.
//  Copyright © 2019 MSKR. All rights reserved.
//

import UIKit

class  CityListViewController: UIViewController {
  
  @IBOutlet private weak var tableView: UITableView!
  
  private let model = CityListViewModel()
  private weak var refresher: UIRefreshControl?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
  }
  
  private func setupTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.tableFooterView = UIView()
    tableView.register(UINib(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "CityTableViewCell")
    
    let refresher = UIRefreshControl()
    refresher.addTarget(self, action: #selector(pulledToRefresh), for: .valueChanged)
    tableView.refreshControl = refresher
    self.refresher = refresher
  }
  
  private func openCityInfoViewController(city: City) {
    guard let cityInfoViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CityInfoViewController") as? CityInfoViewController else { return }
    cityInfoViewController.setup(model: CityInfoViewModel(city: city))
    navigationController?.pushViewController(cityInfoViewController, animated: true)
  }
  
  @objc private func pulledToRefresh() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
      self?.refresher?.endRefreshing()
      self?.tableView.reloadData()
    }
  }
}

extension CityListViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return model.cities.count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70.0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell") as? CityTableViewCell else { fatalError() }
    cell.setup(model: CityTableViewCellModel(city: model.cities[indexPath.row]))
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
  }
}
