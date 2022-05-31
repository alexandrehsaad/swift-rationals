// FractionTests.swift
// RationalsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Rationals

final class FractionTests: XCTestCase {
	typealias TestSubject =  Fraction
	
	func test_initializedApproximatlySucceeds() {
		// Given
		let fractions: Array<(lhs: Double, rhs: TestSubject)> = [
			(.pi, 355/113),
			(-0.111111111, -1/9),
			(0.333333333, 1/3),
			(0.836363636, 46/55),
			(0.000100010, 1/9999),
			(7.481818181, 823/110),
			(0.444444444, 4/9),
			(0.565656565, 56/99),
			(0.012012012, 4/333),
			(0.999999999, 1/1),
			(0.000444444, 1/2250),
			(0.005656565, 5/884),
			(0.000120120, 1/8325),
			(1.234444444, 1111/900),
			(0.378978978, 512/1351),
		]
		
		// Then
		for fraction in fractions {
			let lhs: TestSubject = .init(approximately: fraction.lhs)
			let rhs: TestSubject = fraction.rhs
			
			XCTAssertEqual(lhs, rhs)
		}
	}
}
