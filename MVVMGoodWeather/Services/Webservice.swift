//
//  Webservice.swift
//  MVVMGoodWeather
//
//  Created by Ali Elkoca on 6.12.2020.
//

import Foundation

struct Resource<T/*,U,K*/> {
    
    
    let url: URL
    let parse: (Data) -> T? // here , data to be converted to type(T) that we need
    //let parse2: (Data) -> U?
    //let parse3: (Data) -> K?
}

final class Webservice {
    
  func load<T/*,U,K*/>(resource: Resource<T/*,U,K*/> , completion: @escaping (T?) -> ()) {
          
      let task = URLSession.shared.dataTask(with: resource.url) { data, response, error in

            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
