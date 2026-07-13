//
//  CalculatorViewModel.swift
//  SplitBill
//
//  Created by Gül Çavdar on 13.07.2026.
//

import SwiftUI
import Combine

class CalculatorViewModel: ObservableObject {
    @Published var totalAmount: String = ""
    @Published var tipPercentage: Double = 15.0
    @Published var personCount: String = ""
    
    @Published var resultPerPerson: Double = 0.0
    @Published var errorMessage: String? = nil
    
    private let calculator = SplitCalculator()
    
    func calculate() {
        guard let total = Double(totalAmount),
              let people = Int(personCount) else {
            errorMessage = "Lütfen geçerli sayılar girin."
            resultPerPerson = 0.0
            return
        }
        
        do {
            let result = try calculator.calculatePerPerson(totalAmount: total, tipPercentage: tipPercentage, personCount: people)
            resultPerPerson = result
            errorMessage = nil // Başarılıysa hatayı ekrandan sil
        } catch SplitError.zeroPerson {
            errorMessage = "HATA: Kişi sayısı 0 olamaz."
            resultPerPerson = 0.0
        } catch {
            errorMessage = "Bilinmeyen bir hata oluştu."
            resultPerPerson = 0.0
        }
    }
}
