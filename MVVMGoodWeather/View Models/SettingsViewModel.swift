//
//  SettingsViewModel.swift
//  MVVMGoodWeather
//
//  Created by Ali Elkoca on 8.12.2020.
//

import Foundation

enum Unit: String , CaseIterable{
    
    case celsius = "metric"
    case fahrenheit = "imperial"
    
}

extension Unit {
    
    var displayName: String {
        get {
            switch(self) {
            case .celsius:
                return "Celsuis"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
    
}

struct SettingsViewModel {
    
    let units = Unit.allCases
    
}
