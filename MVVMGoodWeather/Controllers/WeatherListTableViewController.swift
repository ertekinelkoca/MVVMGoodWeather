//
//  WeatherListTableViewController.swift
//  MVVMGoodWeather
//
//  Created by Ali Elkoca on 5.12.2020.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController , AddWeatherDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        print(vm.name)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("navigation controller not found")
        }
        
        guard  let addWeatherCityVC = nav.viewControllers.first as?  AddWeatherCityViewController else {
            fatalError("AddWeatherCityController not found")
        }
         
        addWeatherCityVC.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        cell.cityNameLabel.text = "Huston"
        cell.temperatureLabel.text = "18°"
        return cell
        
    }
}
