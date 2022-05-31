// MixedFraction+Equivalentable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension MixedFraction: Equivalentable {
	public func isEquivalent(to rhs: Self) -> Bool {
		return self.quotient == rhs.quotient
	}
}
