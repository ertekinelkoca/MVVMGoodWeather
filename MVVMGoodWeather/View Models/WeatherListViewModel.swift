//
//  WeatherListViewModel.swift
//  MVVMGoodWeather
//
//  Created by Ali Elkoca on 6.12.2020.
//

import Foundation
import UIKit

struct WeatherListViewModel {
    
    private(set) var weatherViewModels = [WeatherViewModel]()
    
    mutating func addWeatherViewModel(vm: WeatherViewModel) {
        self.weatherViewModels.append(vm)
    }
    
    func numberOfRows(section: Int) -> Int {
        return self.weatherViewModels.count
    }
    
    func modelAt(index: Int) -> WeatherViewModel {
        return self.weatherViewModels[index]
        
    }
    
    mutating private func toCelcius() {
        
        weatherViewModels = weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.currentTemperature.temperature.value =
                (weatherModel.currentTemperature.temperature.value - 32) * 5/9
            return weatherModel
        }
        
    }
    
    mutating private func toFahrenheit() {
        weatherViewModels = weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.currentTemperature.temperature.value =
                (weatherModel.currentTemperature.temperature.value * 9/5 ) + 32
            return weatherModel    }
    
    }
    
    
    mutating func updateUnit(to unit : Unit){
        switch unit {
        case .celsius:
            toCelcius()
        case .fahrenheit:
            toFahrenheit()
            }
        }
    
}

//Type Eraser
class Dynamic <T>: Decodable where T: Decodable {
    
    //typealias Listener = (T) -> () // Type T returns nothing , this just a closure If dynamic string listener will be string
    var listener:((T) -> ())? //Listener? // -> T and create variable using dynamic type so is typealias
    
    // To save actual value of the name below
    // To pass the type
    var value: T {
        didSet{
            listener?(value)
        }
    }
    
    func bind(listener: ((T) -> ())?) {
        self.listener = listener
        self.listener?(self.value)
    }
    
    init(value : T) {
        self.value = value
    }
    
    //to conform decodable protocol which one is going to be decodable
    private enum CodingKeys: CodingKey {
        case value
    }
}


    
struct WeatherViewModel : Decodable   {
    
    let name: Dynamic<String>
    var currentTemperature: TemperatureViewModel
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
    
        name = Dynamic(value: try container.decode(String.self, forKey: .name))
        currentTemperature = try  container.decode(TemperatureViewModel.self, forKey: .currentTemperature)
    }
    
    private enum CodingKeys : String , CodingKey {
        case name
        case currentTemperature = "main"
    }
 
} 

struct TemperatureViewModel : Decodable {
    
    var temperature : Dynamic<Double>
    let temperatureMin : Dynamic<Double>
    let temperatureMax : Dynamic<Double>
    
    init(from decoder : Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        temperature = Dynamic(value: try container.decode(Double.self, forKey: .temperature))
        temperatureMin = Dynamic(value: try container.decode(Double.self, forKey: .temperatureMin))
        temperatureMax = Dynamic(value: try container.decode(Double.self, forKey: .temperatureMax))
    }
    
    private enum CodingKeys : String , CodingKey {
        
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    
    }
}
