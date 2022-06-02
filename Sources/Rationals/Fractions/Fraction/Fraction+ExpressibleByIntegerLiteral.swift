// Fraction+ExpressibleByIntegerLiteral.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Fraction: ExpressibleByIntegerLiteral {
	public init(integerLiteral value: IntegerLiteralType) {
		let numerator: Term = .init(value)
		self.init(numerator, on: 1)
    }
}
