// FractionableTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

protocol FractionableTests: XCTestCase {
	associatedtype TestSubject
	where TestSubject: Fractionable
	
	func test_quotientSucceeds()
	func test_isUnitReturnsFalse()
	func test_isUnitReturnsTrue()
	func test_isProperReturnsFalse()
	func test_isProperReturnsTrue()
	func test_isImproperReturnsFalse()
	func test_isImproperReturnsTrue()
	func test_isWholeReturnsFalse()
	func test_isWholeReturnsTrue()
	func test_isDyadicReturnsFalse()
	func test_isDyadicReturnsTrue()
	func test_isLikeReturnsFalse()
	func test_isLikeReturnsTrue()
}

extension FractionableTests {
	func isUnitReturnsFalse() {
		// Given
		let fraction: TestSubject = .init(2, on: 2)
		
		// Then
		XCTAssertFalse(fraction.isUnit)
	}
	
	func isUnitReturnsTrue() {
		// Given
		let fraction: TestSubject = .init(1, on: 2)
		
		// Then
		XCTAssertTrue(fraction.isUnit)
	}
	
	func isWholeReturnsFalse() {
		// Given
		let value: TestSubject = .init(1, on: 2)

		// Then
		XCTAssertFalse(value.isWhole)
	}

	func isWholeReturnsTrue() {
		// Given
		let value: TestSubject = .init(2, on: 2)

		// Then
		XCTAssertTrue(value.isWhole)
	}

	func isProperReturnsFalse() {
		// Given
		let fraction: TestSubject = .init(5, on: 4)
		
		// Then
		XCTAssertFalse(fraction.isProper)
	}
	
	func isProperReturnsTrue() {
		// Given
		let fraction: TestSubject = .init(3, on: 4)
		
		// Then
		XCTAssertTrue(fraction.isProper)
	}
	
	func isImproperReturnsFalse() {
		// Given
		let fraction: TestSubject = .init(3, on: 4)
		
		// Then
		XCTAssertFalse(fraction.isImproper)
	}
	
	func isImproperReturnsTrue() {
		// Given
		let fraction: TestSubject = .init(5, on: 4)
		
		// Then
		XCTAssertTrue(fraction.isImproper)
	}
	
	func isDyadicReturnsFalse() {
		// Given
		let fraction: TestSubject = .init(1, on: 3)
		
		// Then
		XCTAssertFalse(fraction.isDyadic)
	}
	
	func isDyadicReturnsTrue() {
		// Given
		let fraction: TestSubject = .init(1, on: 2)
		
		// Then
		XCTAssertTrue(fraction.isDyadic)
	}
	
	func isLikeReturnsFalse() {
		// Given
		let lhs: TestSubject = .init(2, on: 2)
		let rhs: TestSubject = .init(1, on: 1)
		
		// When
		let result: Bool = lhs.isLike(rhs)
		
		// Then
		XCTAssertFalse(result)
	}
	
	func isLikeReturnsTrue() {
		// Given
		let lhs: TestSubject = .init(1, on: 2)
		let rhs: TestSubject = .init(2, on: 2)
		
		// When
		let result: Bool = lhs.isLike(rhs)
		
		// Then
		XCTAssertTrue(result)
	}
}

extension FractionableTests {
	func isNormalizedReturnsFalse()
	where TestSubject: Negateable {
		// Given
		let value: TestSubject = .init(1, on: -1)
		
		// Then
		XCTAssertFalse(value.isNormalized)
	}
	
	func isNormalizedReturnsTrue()
	where TestSubject: Negateable {
		// Given
		let value: TestSubject = .init(-1, on: 1)
		
		// Then
		XCTAssertTrue(value.isNormalized)
	}
	
	func nomalizedSucceeds()
	where TestSubject: Negateable {
		// Given
		let value: TestSubject = .init(1, on: -1).normalized()
		
		// Then
		XCTAssertTrue(value.isNormalized)
	}
	
	func nomalizeSucceeds()
	where TestSubject: Negateable {
		// Given
		var value: TestSubject = .init(1, on: -1)
		
		// When
		value.normalize()
		
		// Then
		XCTAssertTrue(value.isNormalized)
	}
}
