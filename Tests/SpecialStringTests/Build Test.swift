//
//  Build Test.swift
//  SpecialString
//
//  Makes sure it builds
//
//  Created by Ben Leggiero on 2019-10-02.
//  Copyright 2019 BH-1-PS.
//

import Foundation
import SpecialString



struct NotAString: EssentiallyAString {
    
    var rawValue: String
    
    init(rawValue: String) {
        self.rawValue = rawValue
    }
}
