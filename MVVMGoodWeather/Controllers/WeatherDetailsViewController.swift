//
//  WeatherDetails.swift
//  MVVMGoodWeather
//
//  Created by Ali Elkoca on 11.12.2020.
//

import Foundation
import UIKit

class WeatherDetailsViewController : UIViewController {
    
    
    @IBOutlet weak var cityNameLabel : UILabel!
    @IBOutlet weak var currentTemperatureLabel : UILabel!
    @IBOutlet weak var maxTempLabel : UILabel!
    @IBOutlet weak var minTempLabel : UILabel!
    
    var weatherViewModel : WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let weatherViewModel = self.weatherViewModel {
            
            self.cityNameLabel.text  = self.weatherViewModel?.name.value
            self.currentTemperatureLabel.text = self.weatherViewModel?.currentTemperature.temperature.value.formatAsDegree
            //self.maxTempLabel.text = self.weatherViewModel?.currentTemperature.temperatureMax.formatAsDegree
            //self.minTempLabel.text = self.weatherViewModel?.currentTemperature.temperatureMin.formatAsDegree
              
        } 
        
    }
    
}
