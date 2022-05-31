// Percentage+Negateable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Percentage: Negateable {
	public prefix static func - (operand: Self) -> Self {
		guard operand.isNaN == false else {
			return .nan
		}
		
		let newNumerator: Double = -operand.numerator
		
		return .init(newNumerator)
	}
}
