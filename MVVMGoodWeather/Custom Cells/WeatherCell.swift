//
//  WeatherCell.swift
//  MVVMGoodWeather
//
//  Created by Ali Elkoca on 5.12.2020.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(vm :WeatherViewModel  ) {
        
        self.cityNameLabel.text = vm.name.value
        self.temperatureLabel.text = "\(vm.currentTemperature.temperature.value.formatAsDegree)"
        
    }
    
    
}
