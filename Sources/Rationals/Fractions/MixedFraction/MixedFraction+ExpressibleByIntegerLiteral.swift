// MixedFraction+ExpressibleByIntegerLiteral.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension MixedFraction: ExpressibleByIntegerLiteral {
	public init(integerLiteral value: IntegerLiteralType) {
		self.init(0, value, on: 1)
	}
}
