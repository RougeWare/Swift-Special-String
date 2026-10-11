//
//  SpecialString.swift
//  SpecialString
//
//  Created by Ky on 2019-10-02.
//



/// A string which has a special purpose, such as being an identifier, a notification name, a URL, or something else
/// which is basically a string, but giving it type information is important andor useful
public struct SpecialString<SpecialType: SpecialStringSpecialType> {
    
    /// The actual string value of the specialized string
    @usableFromInline
    internal var stringValue: String
}



public extension SpecialString {
    
    /// Converts this type-safe string into a string which has no type safety other than being a string.
    ///
    /// - Attention: Be careful to never misplace the resulting string! Doing so might have unintended consequences in
    ///              your software.
    @inlinable
    func withoutTypeSafety() -> String { stringValue }
}



extension SpecialString: EssentiallyAString {
    
    /// A requirement. Use `withoutTypeSafety()` instead.
    /// Attempting to use this to mutate this string will be ignored silently.
    @available(*,
        deprecated,
        renamed: "withoutTypeSafety()",
        message: "Instead of accessing the raw value directly, you should use the more semantic method `withoutTypeSafety()`"
    )
    @inlinable
    public var rawValue: String {
        @available(*,
            deprecated,
            renamed: "withoutTypeSafety()",
            message: "Instead of accessing the raw value directly, you should use the more semantic method `withoutTypeSafety()`"
        )
        get { withoutTypeSafety() }
        
        @available(*,
            unavailable,
            message: """
                To ensure the special string is always created as intended, you may not mutate the contents of a special string.
                Instead, create new instances using the same checks you used when creating the special string.
                """
        )
        set { /* do nothing */ }
    }
    
    
    /// Creates a new special string with the given internal value
    ///
    /// - Parameter rawValue: The raw, untyped string value
    public init(rawValue: String) {
        self.stringValue = rawValue
    }
}



/// A marker protocol to which all special string special types conform
public protocol SpecialStringSpecialType {
    // Empty on-purpose; Marker protocol
}



// MARK: - Passthrough conformance

// MARK: Concurrency

#if swift(>=5.5)
extension SpecialString: Sendable where SpecialType: Sendable {}
#endif
