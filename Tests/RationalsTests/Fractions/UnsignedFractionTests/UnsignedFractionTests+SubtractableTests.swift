// UnsignedFractionTests+SubtractableTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

extension UnsignedFractionTests {
	func test_subtractionReturnsLike() {
		// Given
		let minuend: TestSubject = .init(3, on: 4)
		let subtrahend: TestSubject = .init(1, on: 4)
		
		// When
		let difference: TestSubject = minuend - subtrahend
		
		// Then
		XCTAssertEqual(difference, .init(2, on: 4))
	}
	
	func test_subtractionSucceeds() {
		// Given
		let minuend: TestSubject = 6
		let subtrahend: TestSubject = 4
		
		// When
		let difference: TestSubject = minuend - subtrahend

		// Then
		XCTAssertEqual(difference, 2)
	}
	
	func test_subtractionEqualSucceeds() {
		// Given
		var difference: TestSubject = 6
		let subtrahend: TestSubject = 4
		
		// When
		difference -= subtrahend

		// Then
		XCTAssertEqual(difference, 2)
	}
	
	func test_subtractingSucceeds() {
		// Given
		let minuend: TestSubject = 6
		let subtrahend: TestSubject = 4
		
		// When
		let difference: TestSubject = minuend.subtracting(subtrahend)

		// Then
		XCTAssertEqual(difference, 2)
	}
	
	func test_subtractSucceeds() {
		// Given
		var difference: TestSubject = 6
		let subtrahend: TestSubject = 4
		
		// When
		difference.subtract(subtrahend)

		// Then
		XCTAssertEqual(difference, 2)
	}
}
