// MixedFractionTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

final class MixedFractionTests: XCTestCase {
	typealias TestSubject = MixedFraction<Int16>
	
	func test_isMixableReturnsFalse() {
		// Given
		let value: TestSubject = .init(3, on: 4)

		// When
		let result: Bool = value.isMixable

		// Then
		XCTAssertFalse(result)
	}
	
	func test_isMixableReturnsTrue() {
		// Given
		let value: TestSubject = .init(1, 7, on: 4)

		// When
		let result: Bool = value.isMixable

		// Then
		XCTAssertTrue(result)
	}
	
	func test_isMixedReturnsFalse() {
		// Given
		let value: TestSubject = .init(11, on: 4)

		// When
		let result: Bool = value.isMixed

		// Then
		XCTAssertFalse(result)
	}

	func test_isMixedReturnsTrue() {
		// Given
		let value: TestSubject = .init(2, 3, on: 4)

		// When
		let result: Bool = value.isMixed

		// Then
		XCTAssertTrue(result)
	}

	func test_mixedSucceeds() {
		// Given
		let value: TestSubject = .init(11, on: 4).mixed()

		// When
		let result: Bool = value.isMixed

		// Then
		XCTAssertTrue(result)
	}

	func test_unmixedSucceeds() {
		// Given
		let value: TestSubject = .init(2, 3, on: 4).unmixed()
		
		// When
		let result: Bool = value.isMixed

		// Then
		XCTAssertFalse(result)
	}
}
