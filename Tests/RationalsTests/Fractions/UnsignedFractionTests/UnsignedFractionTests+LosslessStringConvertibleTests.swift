// UnsignedFractionTests+LosslessStringConvertibleTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

extension UnsignedFractionTests {
	func test_initializedWithStringFails() {
		// Given
		let strings: Set<String> = ["1 / 2", "1÷2", "1.0/2.0"]
		
		// Then
		for string in strings {
			XCTAssertNil(TestSubject.init(string))
		}
	}
	
	func test_initializedWithStringSucceeds() {
		// Given
		let strings: Set<String> = ["1", "1/2"]
		
		// Then
		for string in strings {
			XCTAssertNotNil(TestSubject.init(string))
		}
	}
}
