// PercentageTests+CustomStringConvertibleTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

extension PercentageTests {
	func test_descriptionSucceeds() {
		// Given
		let value: TestSubject = 4
		
		// Then
		XCTAssertEqual(value.description, "4.0%")
	}
}
