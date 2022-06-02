// UnsignedFractionTests+SimplifiableTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

extension UnsignedFractionTests: SimplifiableTests {
	func test_isSimplifiableReturnsFalse() {
		// Given
		let value: TestSubject = .init(1, on: 2)

		// When
		let result: Bool = value.isSimplifiable

		// Then
		XCTAssertFalse(result)
	}
	
	func test_isSimplifiableReturnsTrue() {
		// Given
		let value: TestSubject = .init(2, on: 4)

		// When
		let result: Bool = value.isSimplifiable

		// Then
		XCTAssertTrue(result)
	}
	
	func test_isSimplifiedReturnsFalse() {
		// Given
		let value: TestSubject = .init(2, on: 4)
		
		// Then
		XCTAssertFalse(value.isSimplified)
	}
	
	func test_isSimplifiedReturnsTrue() {
		// Given
		let value: TestSubject = .init(1, on: 2)
		
		// Then
		XCTAssertTrue(value.isSimplified)
	}
	
	func test_simplifiedSucceeds() {
		// Given
		let value: TestSubject = .init(2, on: 4).simplified()
		
		// Then
		XCTAssertTrue(value.isSimplified)
	}
	
	func test_simplifySucceeds() {
		// Given
		var value: TestSubject = .init(2, on: 4)
		
		// When
		value.simplify()
		
		// Then
		XCTAssertTrue(value.isSimplified)
	}
}
