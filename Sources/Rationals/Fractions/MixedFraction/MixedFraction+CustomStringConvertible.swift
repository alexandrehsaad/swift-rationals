// MixedFraction+CustomStringConvertible.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension MixedFraction: CustomStringConvertible {
	/// A textual representation of this instance.
	///
	/// ```swift
	/// let fraction: MixedFraction = .init(1, 2, on: 3)
	/// print(fraction)
	/// // Prints "1 2/3"
	/// ```
	public var description: String {
		guard self.isNaN == false else {
			return "nan"
		}
		
		guard self.isInfinite == false else {
			let sign: String = self.isNegative ? "-" : ""
			return sign + "inf"
		}
		
		guard self.isZero == false else {
			return "0"
		}
		
		let integral: String = self.integral.description
		let spacer: String = " "
		let fractional: String = self.fractional.description
		
		switch self.isMixed {
		case true where self.fractional.numerator != 0:
			return integral + spacer + fractional
		case true where self.fractional.numerator == 0:
			return integral
		default:
			return fractional
		}
	}
}
