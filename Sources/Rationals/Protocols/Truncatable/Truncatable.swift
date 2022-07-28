// Truncatable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be truncated.
internal protocol Truncatable: BinaryFloatingPoint {}

extension Truncatable {
	
	// MARK: - Inspecting Values

	/// A boolean value indicating whether this instance is an integer.
	internal var isInteger: Bool {
		guard self != .infinity else {
			return false
		}

		return self == self.integral
	}

	// MARK: - Dissecting Values

	/// The integral part of this instance.
	internal var integral: Self {
		return self.rounded(.towardZero)
	}

	/// The fractional part of this instance.
	internal var fractional: Self {
		guard self.isFinite else {
			return .nan
		}

		let fractional: Self = self - self.integral

		// FIXME: rounding error
		return fractional.truncated(to: self.countPlaces)
	}

	/// The decimal part of this instance.
	internal var decimal: Self {
		guard self.isFinite else {
			return .nan
		}

		let exponent: Self = .init(10 ** self.countPlaces)
		let decimal: Self = self.fractional * exponent
		return decimal.rounded(.towardZero)
	}

	// MARK: - Counting Values

	/// The number of total digits in this instance.
	internal var countDigits: UInt {
		guard self.isFinite else {
			return 0
		}

		var currentNumber = self
		var count: UInt = 1

		while currentNumber.magnitude > 9 {
			currentNumber /= 10
			count += 1
		}

		return count + self.countPlaces
	}

	/// The number of decimal places in this instance.
	internal var countPlaces: UInt {
		guard self.isNormal else {
			return 0
		}

		var currentNumber: Self = self
		var count: UInt = 0

		while currentNumber != currentNumber.integral {
			currentNumber *= 10
			count += 1
		}

		return count
	}

	// MARK: - Truncating Values

	/// Returns this instance truncated to the specified decimal place.
	///
	/// ```swift
	/// print(1.2345.truncated(to: 2))
	/// // Prints "1.23"
	/// ```
	///
	/// - parameter countPlaces: The number of decimals places.
	/// - returns: This instance truncated.
	internal func truncated(to decimalPlace: UInt) -> Self {
		let divisor: Double = 10 ** decimalPlace

		return (self * .init(divisor)).rounded() / .init(divisor)
	}

	/// Truncates this instance to the specified decimal place.
	///
	/// ```swift
	/// var number: Float = 1.2345
	/// number.truncated(to: 2)
	/// print(number)
	/// // Prints "1.23"
	/// ```
	///
	/// - parameter countPlaces: The number of decimals places.
	internal mutating func truncate(to decimalPlace: UInt) {
		self = self.truncated(to: decimalPlace)
	}
}
