// MixedFraction+LosslessStringConvertible.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension MixedFraction: LosslessStringConvertible {
	public init?(_ description: String) {
		if description == "-nan" || description == "nan" {
			self = .nan
		} else if description == "-inf" {
			self = .negativeInfinity
		} else if description == "inf" {
			self = .infinity
		} else if let value = Int(description) {
			self.init(integerLiteral: value)
		} else if let value = Double(description) {
			self.init(floatLiteral: value)
		} else {
			
			var substrings: Array<Substring> = description.split(separator: " ", maxSplits: 2, omittingEmptySubsequences: false)
			
			if substrings.count != 2 {
				substrings.insert("0", at: 0)
			}
			
			substrings.replaceSubrange(1..., with: substrings[1].split(separator: "/", maxSplits: 2, omittingEmptySubsequences: false))
			
			guard substrings.count == 3,
				  let newIntegral: Int = .init(substrings[0]),
				  let newNumerator: Int = .init(substrings[1]),
				  let newDenominator: Int = .init(substrings[2]) else {
				return nil
			}
			
			self.init(newIntegral, newNumerator, on: newDenominator)
		}
	}
}
