//
//  BindingTextField.swift
//  MVVMGoodWeather
//
//  Created by Ali Elkoca on 10.12.2020.
//

import Foundation
import UIKit

class BindingTextField : UITextField {
    
    var textChangeClosure : (String) -> () = { _ in }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    //Sets the closure
    func bind(callback : @escaping (String) -> ()) {
        self.textChangeClosure = callback
    }
    
    private func commonInit() {
        self.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
    }
    
    @objc func textFieldChange(textField : UITextField) {
        
        if let text = textField.text {
            self.textChangeClosure(text)
        }
    }
    
}
