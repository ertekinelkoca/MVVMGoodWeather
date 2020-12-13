//
//  AddWeatherCityViewController.swift
//  MVVMGoodWeather
//
//  Created by Ali Elkoca on 5.12.2020.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm:WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    private var addCityViewModel = AddCityViewModel()
    
    @IBOutlet weak var cityNameTextField : BindingTextField! {
        didSet {
             cityNameTextField.bind {
                self.addCityViewModel.city = $0
            }
        }
    }
    
    @IBOutlet weak var stateTextField : BindingTextField! {
        didSet {
            stateTextField.bind {
                self.addCityViewModel.state = $0
            }
        }
    }
    
    @IBOutlet weak var zipCodeTextField : BindingTextField! {
        didSet {
            zipCodeTextField.bind {
                self.addCityViewModel.zipCode = $0
            }
        }
    }
 
    //Optional becuase
    var delegate : AddWeatherDelegate?
    
    @IBAction func saveCityButtonPressed() {
        
        if let city = cityNameTextField.text {
            
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=02ad8dd66fd8ee617c9bdac5c786989f&units=imperial")!
           
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { data in
                
            let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
 
                return weatherVM
            }
            
            Webservice().load(resource: weatherResource) { [weak self] result in
                 
                if let weatherVM = result {
                    
                    if let delegate = self?.delegate {
                        
                        delegate.addWeatherDidSave(vm: weatherVM)
                        
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

