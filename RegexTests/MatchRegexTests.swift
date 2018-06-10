//
//  MatchRegexTests.swift
//  RegexTests
//
//  Created by Miguel Angel Adan Roman on 10/6/18.
//  Copyright © 2018 Avantiic. All rights reserved.
//

import XCTest

class MatchRegexTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testThatTextContainsEmails() {
        let string = "Lorem a@domain.com ipsum a.a@my-domain.net dolor sit amet."
        let resultMatches = string.matches(regex: "\\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}\\b")
        let expectedMatches = ["a@domain.com", "a.a@my-domain.net"]
        
        XCTAssertEqual(resultMatches.count, expectedMatches.count, "Number of matches should be \(expectedMatches.count)")
        if resultMatches.count == expectedMatches.count {
            for (i, expectedMatch) in expectedMatches.enumerated() {
                XCTAssertEqual(resultMatches[i], expectedMatch, "Part \(i) should be: \(expectedMatch)")
            }
        }
    }
}
