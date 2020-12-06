//
//  WeatherListViewModel.swift
//  MVVMGoodWeather
//
//  Created by Ali Elkoca on 6.12.2020.
//

import Foundation

struct WeatherListViewModel {
    
    private var weatherViewModels = [WeatherViewModel]()
    
    
    
}

struct WeatherViewModel {
    
    let name : String
    let temperature : Double
    let temperatureMin : Double
    let temperatureMax : Double
    
    
}
