// SignedFractionTests+JSONDecodableTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

extension SignedFractionTests {
	func test_decodeFromJSONSucceeds() throws {
		// Given
		let bundle: Bundle = .module
		let url: URL? = bundle.url(forResource: "Fraction", withExtension: "json")
		let data: Data? = try .init(contentsOf: XCTUnwrap(url))
		
		// When
		let decoder: JSONDecoder = .init()
		let result: TestSubject = try decoder.decode(TestSubject.self, from: XCTUnwrap(data))
		
		// Then
		let value: TestSubject = .init(1, on: 2)
		XCTAssertEqual(result, value)
	}
}
