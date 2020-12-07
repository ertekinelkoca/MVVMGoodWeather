//
//  SettingsTableViewController.swift
//  MVVMGoodWeather
//
//  Created by Ali Elkoca on 8.12.2020.
//

import Foundation
import UIKit

class SettingsTableViewController: UITableViewController {
    
    private var settingsViewModel = SettingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.settingsViewModel.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let settingsItem = self.settingsViewModel.units[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        
        cell.textLabel?.text = settingsItem.displayName
        
        return cell
    }
    
    
    
    
}
