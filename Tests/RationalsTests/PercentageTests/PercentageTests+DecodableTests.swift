// PercentageTests+DecodableTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

extension PercentageTests {
	func test_decodeSucceeds() throws {
		// Given
		let data: Data = "4".data(using: .utf8)!
		let decoder: JSONDecoder = .init()

		// When
		let value: TestSubject? = try decoder.decode(Percentage.self, from: data)

		// Then
		XCTAssertEqual(value, 4)
	}
}
