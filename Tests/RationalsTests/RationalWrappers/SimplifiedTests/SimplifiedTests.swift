// SimplifiedTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

final class SimplifiedTests: XCTestCase {
    func test_simplifiedSucceeds() {
		// Given
		@Simplified
		var fraction: Fraction = .init(2, on: 4)
		
		// Then
        XCTAssertTrue(fraction.isSimplified)
        XCTAssertEqual(fraction, .init(1, on: 2))
    }
}
