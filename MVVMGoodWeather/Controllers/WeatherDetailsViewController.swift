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
    
        setupVMBindings()
    
    }
    
    private func setupVMBindings() {
        
        if let weatherVM = self.weatherViewModel {
            weatherVM.name.bind {
                print($0)
                self.cityNameLabel.text = $0}
            weatherVM.currentTemperature.temperature.bind{ self.currentTemperatureLabel.text = $0.formatAsDegree}
        }
        
        
        
        
        //change the value after few second , fake changings
        DispatchQueue.main.asyncAfter (deadline: .now() + 2.0) {
            self.weatherViewModel?.name.value = "Boston"
        }
    }
}
    

