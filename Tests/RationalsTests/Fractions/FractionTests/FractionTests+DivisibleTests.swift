// FractionTests+DivisibleTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

extension FractionTests {
	func test_isInvertibleReturnsFalse() {
		// Given
		let value: TestSubject = .zero
		
		// When
		let result: Bool = value.isInvertible
		
		// Then
		XCTAssertFalse(result)
	}
	
	func test_isInvertibleReturnsTrue() {
		// Given
		let value: TestSubject = 1
		
		// When
		let result: Bool = value.isInvertible
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_isDivisibleByReturnsFalse() {
		// Given
		let dividend: TestSubject = 3
		let divisor: TestSubject = 0
		
		// When
		let result: Bool = dividend.isDivisible(by: divisor)
		
		// Then
		XCTAssertFalse(result)
	}
	
	func test_isDivisibleByReturnsTrue() {
		// Given
		let dividend: TestSubject = 3
		let divisor: TestSubject = 1
		
		// When
		let result: Bool = dividend.isDivisible(by: divisor)
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_isFactorOfReturnsFalse() {
		// Given
		let dividend: TestSubject = 2
		let divisor: TestSubject = 3
		
		// When
		let result: Bool = dividend.isFactor(of: divisor)
		
		// Then
		XCTAssertFalse(result)
	}
	
	func test_isFactorOfReturnsTrue() {
		// Given
		let dividend: TestSubject = 1
		let divisor: TestSubject = 2
		
		// When
		let result: Bool = dividend.isFactor(of: divisor)
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_divisionReturnsNonLike() {
		// Given
		let dividend: TestSubject = .init(1, on: 2)
		let divisor: TestSubject = .init(2, on: 2)
		
		// When
		let quotient: TestSubject = dividend / divisor
		
		// Then
		XCTAssertEqual(quotient, .init(2, on: 4))
	}
	
	func test_divisionSucceeds() {
		// Given
		let dividend: TestSubject = 6
		let divisor: TestSubject = 2
		
		// When
		let quotient: TestSubject = dividend.dividing(by: divisor)
		
		// Then
		XCTAssertEqual(quotient, 6/2)
	}
	
	func test_divisionEqualSucceeds() {
		// Given
		var quotient: TestSubject = 6
		let divisor: TestSubject = 2
		
		// When
		quotient.divide(by: divisor)

		// Then
		XCTAssertEqual(quotient, 6/2)
	}
	
	func test_remainderReturnsNonLike() {
		// Given
		let dividend: TestSubject = 18/3
		let divisor: TestSubject = 5/2
		
		// When
		let quotient: TestSubject = dividend % divisor

		// Then
		XCTAssertEqual(quotient, 6/6)
	}
	
	func test_remainderSucceeds() {
		// Given
		let dividend: TestSubject = 17/2
		let divisor: TestSubject = 5/2
		
		// When
		let quotient: TestSubject = dividend % divisor

		// Then
		XCTAssertEqual(quotient, 2/2)
	}
	
	func test_dividingBySucceeds() {
		// Given
		let dividend: TestSubject = 6
		let divisor: TestSubject = 2
		
		// When
		let quotient: TestSubject = dividend.dividing(by: divisor)
		
		// Then
		XCTAssertEqual(quotient, 6/2)
	}
	
	func test_divideBySucceeds() {
		// Given
		var quotient: TestSubject = 6
		let divisor: TestSubject = 2
		
		// When
		quotient.divide(by: divisor)

		// Then
		XCTAssertEqual(quotient, 6/2)
	}
	
	func test_halvedSucceeds() {
		// Given
		let value: TestSubject = 1
		
		// When
		let half: TestSubject = value.halved()
		
		// Then
		XCTAssertEqual(half, 1/2)
	}
	
	func test_halveSucceeds() {
		// Given
		var value: TestSubject = 1
		
		// When
		value.halve()
		
		// Then
		XCTAssertEqual(value, 1/2)
	}
}
