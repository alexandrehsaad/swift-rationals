// Percentage+Hashable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Percentage: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.numerator)
    }
}
