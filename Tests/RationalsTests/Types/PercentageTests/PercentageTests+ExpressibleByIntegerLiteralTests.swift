// PercentageTests+ExpressibleByIntegerLiteralTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

extension PercentageTests {
	func test_initializedWithIntegerLiteralSucceeds() {
		// Given
		let percentage: TestSubject = 4
		
		// When
		let value: Double = percentage.quotient
		
		// Then
		XCTAssertEqual(value, 0.04)
	}
}
