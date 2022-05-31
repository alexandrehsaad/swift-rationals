// MixedFractionTests+ExpressibleByFloatLiteralTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

extension MixedFractionTests {
	func test_initializedWithFloatLiteralSucceeds() {
		// Given
		let fraction: TestSubject = 4.5
		
		// When
		let value: Double = fraction.quotient
		
		// Then
		XCTAssertEqual(value, 4.5)
	}
}
