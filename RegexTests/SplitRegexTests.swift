//
//  RegexTests.swift
//  RegexTests
//
//  Created by Miguel Angel Adan Roman on 8/6/18.
//  Copyright © 2018 Avantiic. All rights reserved.
//

import XCTest
@testable import Regex

class SplitRegexTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // tearDown code
        super.tearDown()
    }
    
    func testSplitRegexWithMatchTheConsecutiveStrings() {
        let string = "a@domain.com b@b.com"
        let resultParts = string.split(regex: "\\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}\\b")
        let expectedParts = ["a@domain.com", " ", "b@b.com"]
        
        XCTAssertEqual(resultParts.count, expectedParts.count, "Number of matches should be \(expectedParts.count)")
        if resultParts.count == expectedParts.count {
            for (i, expectedPart) in expectedParts.enumerated() {
                XCTAssertEqual(resultParts[i], expectedPart, "Part \(i) should be: \(expectedPart)")
            }
        }
    }
    
    func testSplitRegexWithMatchTheWholeString() {
        let string = "a@domain.com"
        let resultParts = string.split(regex: "\\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}\\b")
        let expectedParts = ["a@domain.com"]
        
        XCTAssertEqual(resultParts.count, expectedParts.count, "Number of matches should be \(expectedParts.count)")
        if resultParts.count == expectedParts.count {
            for (i, expectedPart) in expectedParts.enumerated() {
                XCTAssertEqual(resultParts[i], expectedPart, "Part \(i) should be: \(expectedPart)")
            }
        }
    }
    
    func testSplitRegexWithMatchInLastPosition() {
        let string = "a@domain.com lorem ipsum a.a@my-domain.net dolor sit amet b@b.com"
        let resultParts = string.split(regex: "\\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}\\b")
        let expectedParts = ["a@domain.com", " lorem ipsum ", "a.a@my-domain.net", " dolor sit amet ", "b@b.com"]
        
        XCTAssertEqual(resultParts.count, expectedParts.count, "Number of matches should be \(expectedParts.count)")
        if resultParts.count == expectedParts.count {
            for (i, expectedPart) in expectedParts.enumerated() {
                XCTAssertEqual(resultParts[i], expectedPart, "Part \(i) should be: \(expectedPart)")
            }
        }
    }
    
    func testSplitRegexWithMatchInFirstPosition() {
        let string = "a@domain.com lorem ipsum a.a@my-domain.net dolor sit amet."
        let resultParts = string.split(regex: "\\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}\\b")
        let expectedParts = ["a@domain.com", " lorem ipsum ", "a.a@my-domain.net", " dolor sit amet."]
        
        XCTAssertEqual(resultParts.count, expectedParts.count, "Number of matches should be \(expectedParts.count)")
        if resultParts.count == expectedParts.count {
            for (i, expectedPart) in expectedParts.enumerated() {
                XCTAssertEqual(resultParts[i], expectedPart, "Part \(i) should be: \(expectedPart)")
            }
        }
    }
    
    func testSplitRegexWithMatchInMiddlePosition() {
        let string = "Lorem a@domain.com ipsum a.a@my-domain.net dolor sit amet."
        let resultParts = string.split(regex: "\\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}\\b")
        let expectedParts = ["Lorem ", "a@domain.com", " ipsum ", "a.a@my-domain.net", " dolor sit amet."]
        
        XCTAssertEqual(resultParts.count, expectedParts.count, "Number of matches should be \(expectedParts.count)")
        if resultParts.count == expectedParts.count {
            for (i, expectedPart) in expectedParts.enumerated() {
                XCTAssertEqual(resultParts[i], expectedPart, "Part \(i) should be: \(expectedPart)")
            }
        }
    }
}
