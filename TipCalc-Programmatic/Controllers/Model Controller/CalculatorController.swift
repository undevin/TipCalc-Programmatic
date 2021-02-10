//
//  CalculatorController.swift
//  TipCalc-Programmatic
//
//  Created by Devin Flora on 2/9/21.
//

import Foundation

class CalculatorController {
    
    static let shared = CalculatorController()
    
    func calculateTipTotal(billTotal: Float, numberOfPeople: Int, tipPercentage: Float) -> Float {
        let tipTotal = (billTotal * tipPercentage) / Float(numberOfPeople)
        return tipTotal
    }
}//End of Class
