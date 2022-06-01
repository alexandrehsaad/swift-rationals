// RepresentableByNaN+.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension RepresentableByNaN
where Self: Rational {
	public var isNaN: Bool {
		return self.numerator == 0
			&& self.denominator == 0
	}
	
	public static var nan: Self {
		return .init(0, on: 0)
	}
}
