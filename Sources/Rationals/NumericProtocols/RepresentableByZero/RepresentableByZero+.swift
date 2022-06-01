// RepresentableByZero+.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension RepresentableByZero
where Self: Rational {
	public var isFinite: Bool {
		return self.denominator != 0
	}
	
	public var isInfinite: Bool {
		return self.numerator != 0
			&& self.denominator == 0
	}
	
	public static var infinity: Self {
		return .init(1, on: 0)
	}
}
