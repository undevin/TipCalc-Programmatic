//
//  Calculator.swift
//  TipCalc-Programmatic
//
//  Created by Devin Flora on 2/9/21.
//

import Foundation

class Calculator {
    
    var billTotal: Float
    var numberOfPeople: Int
    var tipPercentage: Float
    
    init(baseTotal: Float, numberOfPeople: Int, tipPercentage: Float) {
        self.billTotal = baseTotal
        self.numberOfPeople = numberOfPeople
        self.tipPercentage = tipPercentage
    }
}//End of Class
