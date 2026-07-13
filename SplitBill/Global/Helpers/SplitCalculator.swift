//
//  SplitCalculator.swift
//  SplitBill
//
//  Created by Gül Çavdar on 13.07.2026.
//

import Foundation

enum SplitError: Error {
    case zeroPerson
    case negativeAmount
}

struct SplitCalculator {
    
    func calculatePerPerson(totalAmount: Double, tipPercentage: Double, personCount: Int) throws -> Double {
        
        if personCount == 0 {
            throw SplitError.zeroPerson
        }
        
        let tipAmount = totalAmount * (tipPercentage / 100.0)
        let grandTotal = totalAmount + tipAmount
        let perPerson = grandTotal / Double(personCount)
        
        return perPerson
    }
}
