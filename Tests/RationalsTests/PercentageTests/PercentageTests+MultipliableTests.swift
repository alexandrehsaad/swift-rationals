// PercentageTests+MultipliableTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

extension PercentageTests {
	func test_isMultipleOfReturnsFalse() {
		// Given
		let multiplicand: TestSubject = 300
		let multiplicator: TestSubject = 0
		
		// When
		let result: Bool = multiplicand.isMultiple(of: multiplicator)
		
		// Then
		XCTAssertFalse(result)
	}
	
	func test_isMultipleOfReturnsTrue() {
		// Given
		let multiplicand: TestSubject = 300
		let multiplicator: TestSubject = 100
		
		// When
		let result: Bool = multiplicand.isMultiple(of: multiplicator)
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_muliplicationSucceeds() {
		// Given
		let multiplicand: TestSubject = 2
		let multiplier: TestSubject = 3
		
		// When
		let product: TestSubject = multiplicand * multiplier
		
		// Then
		XCTAssertEqual(product, 0.0006)
	}
	
	func test_muliplicationEqualSucceeds() {
		// Given
		var product: TestSubject = 2
		let multiplier: TestSubject = 3
		
		// When
		product *= multiplier

		// Then
		XCTAssertEqual(product, 0.0006)
	}
	
	func test_multiplyingBySucceeds() {
		// Given
		let multiplicand: TestSubject = 2
		let multiplier: TestSubject = 3
		
		// When
		let product: TestSubject = multiplicand.multiplying(by: multiplier)
		
		// Then
		XCTAssertEqual(product, 0.0006)
	}
	
	func test_multiplyBySucceeds() {
		// Given
		var product: TestSubject = 2
		let multiplier: TestSubject = 3
		
		// When
		product.multiply(by: multiplier)

		// Then
		XCTAssertEqual(product, 0.0006)
	}
	
	func test_doubledSucceeds() {
		// Given
		let value: TestSubject = 1
		
		// When
		let double: TestSubject = value.doubled()
		
		// Then
		XCTAssertEqual(double, 0.0002)
	}
	
	func test_doubleSucceeds() {
		// Given
		var value: TestSubject = 1
		
		// When
		value.double()
		
		// Then
		XCTAssertEqual(value, 0.0002)
	}
}
