//
//  AddWeatherCityViewController.swift
//  MVVMGoodWeather
//
//  Created by Ali Elkoca on 5.12.2020.
//

import Foundation
import UIKit

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField : UITextField!
    
    @IBAction func saveCityButtonPressed() {
     
        if let city = cityNameTextField.text {
            
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=02ad8dd66fd8ee617c9bdac5c786989f")!
            
            //resource'ta t veya any farkeder mi ?
            let weatherResource = Resource<Any>(url: weatherURL) { data in

                return data
            }
            
            Webservice().load(resource: weatherResource) { result in
                
                
                
            }
            
        }
        
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

