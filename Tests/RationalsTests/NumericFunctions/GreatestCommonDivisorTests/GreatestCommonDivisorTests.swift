// GreatestCommonDivisorTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

final class GreatestCommonDivisorTests: XCTestCase {
	func test_gcd() {
		// Given
		let lhs: Int = 48
		let rhs: Int = 18
		
		// When
		let power: Int = gcd(lhs, rhs)
		
		// Then
		XCTAssertEqual(power, 6)
	}
}
