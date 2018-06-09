//
//  RegexTests.swift
//  RegexTests
//
//  Created by Miguel Angel Adan Roman on 8/6/18.
//  Copyright © 2018 Avantiic. All rights reserved.
//

import XCTest
@testable import Regex

class RegexTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testThatTextContainsEmails() {
        let string = "Lorem a@domain.com ipsum a.a@my-domain.net dolor sit amet."
        let matches = string.matches(regex: "\\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}\\b")
        
        XCTAssertEqual(matches.count, 2, "Number of matches should be two")
        if matches.count == 2 {
            XCTAssertEqual(matches.first, "a@domain.com", "First match should be a@domain.com")
            XCTAssertEqual(matches.last, "a.a@my-domain.net", "Last match should be a.a@my-domain.net")
        }
    }
}
