//
//  TableViewDataSources.swift
//  MVVMGoodWeather
//
//  Created by Ali Elkoca on 6.02.2021.
//

import Foundation
import UIKit

class TableViewDataSource<CellType,ViewModel> : NSObject, UITableViewDataSource where CellType: UITableViewCell , ViewModel : UITableViewCell  {

    let cellIdentifier : String
    var items : [ViewModel]
    let configureCell : (CellType,ViewModel) -> ()
    
    init(cellIdentifier : String , items: [ViewModel] , configureCell: @escaping (CellType,ViewModel) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier,for: indexPath) as? CellType
        else{
            fatalError("gordun mu ?")
        }
        return cell
    }
}
