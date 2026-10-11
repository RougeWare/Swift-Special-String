//
//  Contract tests.swift
//  SpecialString
//
//  Created by Ky on 2026-10-11.
//

import Testing
import SpecialString



struct Test {
    
    /// A special string's equality should be simple to check, and case-sensitive
    @Test func equality() {
        let password: Password = "Foobar"
        
        #expect(password == "Foobar")
        #expect(password != "foobar")
    }
    
    
    /// A special string must never be mutated at runtime
    @Test func immutability() {
        var password: Password = "Baz"
        password.write("X")
        #expect(password == "Baz")
    }
}
