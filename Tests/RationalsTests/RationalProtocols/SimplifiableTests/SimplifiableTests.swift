// SimplifiableTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

protocol SimplifiableTests: XCTestCase {
	associatedtype TestSubject
	where TestSubject: Simplifiable
	
	func test_isSimplifiableReturnsFalse()
	func test_isSimplifiableReturnsTrue()
	func test_isSimplifiedReturnsFalse()
	func test_isSimplifiedReturnsTrue()
	func test_simplifiedSucceeds()
	func test_simplifySucceeds()
}
