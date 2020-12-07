//
//  WeatherListViewModel.swift
//  MVVMGoodWeather
//
//  Created by Ali Elkoca on 6.12.2020.
//

import Foundation

struct WeatherListViewModel {
    
    private var weatherViewModels = [WeatherViewModel]()
    
    mutating func addWeatherViewModel(vm: WeatherViewModel) {
        self.weatherViewModels.append(vm)
    }
    
    func numberOfRows(section: Int) -> Int {
        return self.weatherViewModels.count
    }
    
    func modelAt(index: Int) -> WeatherViewModel {
        return self.weatherViewModels[index]
        
    }
}

struct WeatherViewModel : Decodable {
    
    let name: String
    let currentTemperature: TemperatureViewModel
    
    private enum CodingKeys : String , CodingKey {
        case name
        case currentTemperature = "main"
    }
 
} 

struct TemperatureViewModel : Decodable {
    
    let temperature : Double
    let temperatureMin : Double
    let temperatureMax : Double
    
    private enum CodingKeys : String , CodingKey {
        
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
        
    }
}
