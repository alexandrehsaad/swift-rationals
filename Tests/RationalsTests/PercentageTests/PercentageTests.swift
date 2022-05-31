// PercentageTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

final class PercentageTests: XCTestCase {
	typealias TestSubject = Percentage
	
	func test_percentageDecrease() {
		// Given
		let percentage: TestSubject = .init(from: 10, to: 8)
		
		// Then
		XCTAssertEqual(percentage, .init(-20))
	}
	
	func test_percentageIncrease() {
		// Given
		let percentage: TestSubject = .init(from: 10, to: 12)
		
		// Then
		XCTAssertEqual(percentage, .init(20))
	}
	
    func test_quotientSucceeds() {
		// Given
		let percentage: TestSubject = 150
		
		// When
		let quotient: Double = percentage.quotient
		
		// Then
		XCTAssertEqual(quotient, 1.5)
    }
}
