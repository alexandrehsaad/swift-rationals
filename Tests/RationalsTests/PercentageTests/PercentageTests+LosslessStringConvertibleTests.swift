// PercentageTests+LosslessStringConvertibleTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

extension PercentageTests {
	func test_initializedWithStringFails() {
		// Given
		let strings: Set<String> = ["1 %", "1pct"]
		
		// Then
		for string in strings {
			XCTAssertNil(TestSubject.init(string))
		}
	}
	
	func test_initializedWithStringSucceeds() {
		// Given
		let strings: Set<String> = ["-1", "-0.5", "-1%", "1%", "0.5", "1"]
		
		// Then
		for string in strings {
			XCTAssertNotNil(TestSubject.init(string))
		}
	}
}
