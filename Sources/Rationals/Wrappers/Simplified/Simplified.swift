// Simplified.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// A property wrapper that keeps a fraction at its lowest terms.
///
/// ```swift
/// @Simplified
/// var value: Fraction = .init(2, on: 4)
/// print(value.isSimplified)
/// // Prints "true"
/// ```
@propertyWrapper
public struct Simplified<Value>
where Value: RepresentableByZero & Simplifiable {
	
	// MARK: - Creating Instances

    /// Creates a new instance with the specified value.
    ///
    /// - parameter value: The fraction to simplify.
    public init(wrappedValue value: Value) {
        self.wrappedValue = value
    }
	
	// MARK: - Instance Properties
	
	/// The fraction simplified to its lowest terms.
	private var value: Value = .zero

    /// The wrapped value of this property wrapper.
    public var wrappedValue: Value {
        get {
            return self.value
        } set (newValue) {
            self.value = newValue.simplified()
        }
    }
}
