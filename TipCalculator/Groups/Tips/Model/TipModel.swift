//
//  TipModel.swift
//  TipCalculator
//
//  Created by Наджафов Араз on 05.12.2020.
//

import Foundation

class TipCalculator {
    
    var amountBeforeTax: Double = 0
    var tipAmount: Double = 0
    var tipPrecentage: Double = 0
    var totalAmount: Double = 0
    
    init(amountBeforeTax: Double, tipPrecentage: Double) {
        self.amountBeforeTax = amountBeforeTax
        self.tipPrecentage = tipPrecentage
    }
    
    func calculateTip() {
        tipAmount = amountBeforeTax * tipPrecentage
        totalAmount = tipAmount + amountBeforeTax
    }
    
}
