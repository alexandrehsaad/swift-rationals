// FractionTests+FractionableTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

extension FractionTests: FractionableTests {
	func test_quotientSucceeds() {
		// Given
		let value: TestSubject = .init(3, on: 2)
		
		// When
		let quotient: Double = value.quotient
		
		// Then
		XCTAssertEqual(quotient, 1.5)
	}
	
	func test_isUnitReturnsFalse() {
		// Given
		let fraction: TestSubject = .init(2, on: 2)
		
		// Then
		XCTAssertFalse(fraction.isUnit)
	}
	
	func test_isUnitReturnsTrue() {
		// Given
		let fraction: TestSubject = .init(1, on: 2)
		
		// Then
		XCTAssertTrue(fraction.isUnit)
	}
	
	func test_isNormalizedReturnsFalse() {
		// Given
		let value: TestSubject = .init(1, on: -1)
		
		// Then
		XCTAssertFalse(value.isNormalized)
	}
	
	func test_isNormalizedReturnsTrue() {
		// Given
		let value: TestSubject = .init(-1, on: 1)
		
		// Then
		XCTAssertTrue(value.isNormalized)
	}
	
	func test_isProperReturnsFalse() {
		// Given
		let fraction: TestSubject = .init(5, on: 4)
		
		// Then
		XCTAssertFalse(fraction.isProper)
	}
	
	func test_isProperReturnsTrue() {
		// Given
		let fraction: TestSubject = .init(3, on: 4)
		
		// Then
		XCTAssertTrue(fraction.isProper)
	}
	
	func test_isImproperReturnsFalse() {
		// Given
		let fraction: TestSubject = .init(3, on: 4)
		
		// Then
		XCTAssertFalse(fraction.isImproper)
	}
	
	func test_isImproperReturnsTrue() {
		// Given
		let fraction: TestSubject = .init(5, on: 4)
		
		// Then
		XCTAssertTrue(fraction.isImproper)
	}
	
	func test_isWholeReturnsFalse() {
		// Given
		let value: TestSubject = .init(1, on: 2)

		// Then
		XCTAssertFalse(value.isWhole)
	}
	
	func test_isWholeReturnsTrue() {
		// Given
		let value: TestSubject = .init(2, on: 2)

		// Then
		XCTAssertTrue(value.isWhole)
	}
	
	func test_isDyadicReturnsFalse() {
		// Given
		let fraction: TestSubject = .init(1, on: 3)
		
		// Then
		XCTAssertFalse(fraction.isDyadic)
	}
	
	func test_isDyadicReturnsTrue() {
		// Given
		let fraction: TestSubject = .init(1, on: 2)
		
		// Then
		XCTAssertTrue(fraction.isDyadic)
	}
	
	func test_isLikeReturnsFalse() {
		// Given
		let lhs: TestSubject = .init(2, on: 2)
		let rhs: TestSubject = .init(1, on: 1)
		
		// When
		let result: Bool = lhs.isLike(rhs)
		
		// Then
		XCTAssertFalse(result)
	}
	
	func test_isLikeReturnsTrue() {
		// Given
		let lhs: TestSubject = .init(1, on: 2)
		let rhs: TestSubject = .init(2, on: 2)
		
		// When
		let result: Bool = lhs.isLike(rhs)
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_normalizedSucceeds() {
		// Given
		let value: TestSubject = .init(1, on: -1).normalized()
		
		// Then
		XCTAssertTrue(value.isNormalized)
	}
	
	func test_normalizeSucceeds() {
		// Given
		var value: TestSubject = .init(1, on: -1)
		
		// When
		value.normalize()
		
		// Then
		XCTAssertTrue(value.isNormalized)
	}
}
