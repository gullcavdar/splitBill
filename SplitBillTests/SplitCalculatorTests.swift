//
//  SplitBillTests.swift
//  SplitBillTests
//
//  Created by Gül Çavdar on 13.07.2026.
//

import XCTest
@testable import SplitBill

final class SplitCalculatorTests: XCTestCase {
    
    var calculator: SplitCalculator!

    override func setUpWithError() throws {
        calculator = SplitCalculator()
    }

    override func tearDownWithError() throws {
        calculator = nil
    }

    func test_CalculatePerPerson_WithNormalValues_ShouldReturnCorrectAmount() throws {
        let total = 100.0       // 100 TL Hesap
        let tip = 10.0          // %10 Bahşiş
        let people = 2          // 2 Kişi
        
        let result = try calculator.calculatePerPerson(totalAmount: total, tipPercentage: tip, personCount: people)

        XCTAssertEqual(result, 55.0, "100 TL hesap, %10 bahşiş ile 2 kişiye bölündüğünde sonuç 55.0 olmalıdır.")
    }
    
    func test_CalculatePerPerson_WithZeroPeople_ShouldThrowZeroPersonError() {
        let total = 100.0
        let tip = 10.0
        let people = 0
        
        XCTAssertThrowsError(try calculator.calculatePerPerson(totalAmount: total, tipPercentage: tip, personCount: people)) { error in
            XCTAssertEqual(error as? SplitError, SplitError.zeroPerson)
        }
    }
}
