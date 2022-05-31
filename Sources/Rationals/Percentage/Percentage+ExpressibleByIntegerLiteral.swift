// Percentage+ExpressibleByIntegerLiteral.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Percentage: ExpressibleByIntegerLiteral {
	public init(integerLiteral value: IntegerLiteralType) {
        let newNumerator: Double = .init(value)
        self.init(newNumerator)
    }
}
