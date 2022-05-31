// PercentageTests+EncodableTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

extension PercentageTests {
	func test_encodeSucceeds() throws {
		// Given
		let value: TestSubject = 4
		let encoder: JSONEncoder = .init()

		// When
		let data: Data = try encoder.encode(value)

		// Then
		XCTAssertEqual(data, "4".data(using: .utf8))
	}
}
