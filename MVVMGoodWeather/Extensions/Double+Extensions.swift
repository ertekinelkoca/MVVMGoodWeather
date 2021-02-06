//
//  Double+Extensions.swift
//  MVVMGoodWeather
//
//  Created by Ali Elkoca on 7.12.2020.
//

import Foundation

extension Double {
    
    var formatAsDegree: String {
        return String(format: "%.0f°",self)
    }
    
}
