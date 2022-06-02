// SignedFractionTests+RationalTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

extension SignedFractionTests: RationalTests {
	func test_initializedApproximatlySucceeds() {
		// Given
		let fractions: Array<(lhs: Double, rhs: TestSubject)> = [
			(.pi, 355/113),
			(-0.111111111, -1/9),
			(0.333333333, 1/3),
			(0.836363636, 46/55),
			(0.000100010, 1/9999),
			(7.481818181, 823/110),
			(0.444444444, 4/9),
			(0.565656565, 56/99),
			(0.012012012, 4/333),
			(0.999999999, 1/1),
			(0.000444444, 1/2250),
			(0.005656565, 5/884),
			(0.000120120, 1/8325),
			(1.234444444, 1111/900),
			(0.378978978, 512/1351),
		]
		
		// Then
		for fraction in fractions {
			let lhs: TestSubject = .init(approximately: fraction.lhs)
			let rhs: TestSubject = fraction.rhs
			
			XCTAssertEqual(lhs, rhs)
		}
	}
	
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
