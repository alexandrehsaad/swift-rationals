// Fraction+ExpressibleByFloatLiteral.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Fraction: ExpressibleByFloatLiteral
where Term: Negateable {
	public init(floatLiteral value: FloatLiteralType) {
		if value.isNaN {
			self = .nan
		} else if value <= Double(Term.min) {
			self = .negativeInfinity
		} else if Double(Term.max) < value {
			self = .infinity
		} else {
			
			let integral: Term = .init(value.integral)
			let decimal: Term = .init(value.decimal)

			if decimal == .zero {
				self.init(integral, on: 1)
			} else {
				var denominator: Term = 1
				for _ in 1...value.countPlaces {
					denominator *= 10
				}
				
				let numerator: Term = .init(integral * denominator + decimal)
				self.init(numerator, on: denominator)
			}
		}
	}
}
