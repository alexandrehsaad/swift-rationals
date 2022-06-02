// Fraction+LosslessStringConvertible.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import NumericProtocols

extension Fraction: LosslessStringConvertible {
	///
	///
	/// - parameter description:
	private init?(description: String) {
		let substrings: Array<Substring> = description
			.split(separator: "/", maxSplits: 2, omittingEmptySubsequences: false)
		
		guard substrings.count == 2,
			  let numerator: Term = .init(substrings[0]),
			  let denominator: Term = .init(substrings[1]) else {
			return nil
		}
		
		self.init(numerator, on: denominator)
	}
	
    public init?(_ description: String) {
        if description == "-nan" || description == "+nan" || description == "nan" {
            self = .nan
        } else if description == "+inf" || description == "inf" {
            self = .infinity
        } else if let value = Int(description) {
			self.init(integerLiteral: value)
        } else if Double(description) != nil {
			return nil
        } else {
			self.init(description: description)
        }
    }
}

extension Fraction
where Term: Negateable {
	public init?(_ description: String) {
		if description == "-nan" || description == "+nan" || description == "nan" {
			self = .nan
		} else if description == "-inf" {
			self = .negativeInfinity
		} else if description == "+inf" || description == "inf" {
			self = .infinity
		} else if let value = Int(description) {
			self.init(integerLiteral: value)
		} else if let value = Double(description) {
			self.init(floatLiteral: value)
		} else {
			self.init(description: description)
		}
	}
}
