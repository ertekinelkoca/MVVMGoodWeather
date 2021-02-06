//
//  WeatherListTableViewController.swift
//  MVVMGoodWeather
//
//  Created by Ali Elkoca on 5.12.2020.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController , AddWeatherDelegate {

    private var weatherListViewModel = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        self.weatherListViewModel.addWeatherViewModel(vm: vm)
        self.tableView.reloadData()
    }
     
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section: section)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddCityWeatherViewController" {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        }
        
        else if segue.identifier == "SettingsTableViewController" {
            prepareSegueForSettingsTableViewController(segue: segue)
        }
        
        else if segue.identifier == "WeatherDetailsViewController" {
            prepareSegueForWeatherDetailsViewController(segue: segue)
        }
    }
    
    private func prepareSegueForWeatherDetailsViewController(segue: UIStoryboardSegue) {
        
        guard let weatherDetailsVC = segue.destination as? WeatherDetailsViewController,
        let indexPath = self.tableView.indexPathForSelectedRow else {
            return
        }
        let weatherVM = self.weatherListViewModel.modelAt(index: indexPath.row)
        weatherDetailsVC.weatherViewModel = weatherVM
    }
    
    private func prepareSegueForSettingsTableViewController(segue : UIStoryboardSegue) {
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("navigation controller not found")
        }
        
        guard  let settingTVC = nav.viewControllers.first as?  SettingsTableViewController else {
            fatalError("SettingsTableViewController not found")
        }
        settingTVC.delegate = self
    }
    
    private func prepareSegueForAddWeatherCityViewController(segue : UIStoryboardSegue) {
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("navigation controller not found")
        }
        
        guard  let addWeatherCityVC = nav.viewControllers.first as?  AddWeatherCityViewController else {
            fatalError("AddWeatherCityController not found")
        }
        //this tells the addweathercityVC that i am listening to you
        addWeatherCityVC.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        let weatherVM = self.weatherListViewModel.modelAt(index: indexPath.row)
        cell.configure(vm: weatherVM)
        return cell
    }
}

extension WeatherListTableViewController : SettingsDelegate {
    func settingsDone(vm: SettingsViewModel) {
        self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
}
