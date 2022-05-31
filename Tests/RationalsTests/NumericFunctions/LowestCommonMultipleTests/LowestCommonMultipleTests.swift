// LowestCommonMultipleTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

final class LowestCommonMultipleTests: XCTestCase {
	func test_lcm() {
		// Given
		let lhs: Int = 48
		let rhs: Int = 18
		
		// When
		let power: Int = lcm(lhs, rhs)
		
		// Then
		XCTAssertEqual(power, 144)
	}
}
