// FractionTests+EquivalentableTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

extension FractionTests {
	func test_isEquivalentToReturnsFalse() {
		// Given
		let lhs: TestSubject = .init(1, on: 2)
		let rhs: TestSubject = 1
		
		// When
		let result: Bool = lhs.isEquivalent(to: rhs)
		
		// Then
		XCTAssertFalse(result)
	}
	
	func test_isEquivalentToReturnsTrue() {
		// Given
		let lhs: TestSubject = .init(2, on: 2)
		let rhs: TestSubject = 1
		
		// When
		let result: Bool = lhs.isEquivalent(to: rhs)
		
		// Then
		XCTAssertTrue(result)
	}
}
