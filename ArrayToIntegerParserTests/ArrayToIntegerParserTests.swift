//
//
// ArrayToIntegerParserTests.swift
// ArrayToIntegerParserTests
//
// Created by Alexandre Hu (HU JEN EN) on 2021/9/8
// Copyright © 2021 Alexandre Hu. All rights reserved.
//
        

import XCTest
@testable import ArrayToIntegerParser

class ArrayToIntegerParserTests: XCTestCase {
    
    private let parser = ArrayToIntegerParser()

    func testInputIsPositiveAndNotExceededInt32Bound() {
        let input: String = "5566"
        let output = parser.atoi_LC(with: input)
        XCTAssertEqual(output, 5566)
    }
    
    func testInputIsNegativeAndNotExceededInt32Bound() {
        let input: String = "-5566"
        let output = parser.atoi_LC(with: input)
        XCTAssertEqual(output, -5566)
    }
    
    func testInputIsPositiveAndNotExceededInt32BoundButHaveLeadingElement() {
        let input: String = "a5566"
        let output = parser.atoi_LC(with: input)
        XCTAssertEqual(output, 0)
    }
    
    func testInputIsPositiveAndNotExceededInt32BoundButHaveTrailingElement() {
        let input: String = "5566a"
        let output = parser.atoi_LC(with: input)
        XCTAssertEqual(output, 5566)
    }
    
    func testInputIsPositiveAndExceededInt32Bound() {
        let input: String = "91283472332"
        let output = parser.atoi_LC(with: input)
        XCTAssertEqual(output, 2147483647)
    }
    
    func testInputIsNegativeAndExceededInt32Bound() {
        let input: String = "-91283472332"
        let output = parser.atoi_LC(with: input)
        XCTAssertEqual(output, -2147483648)
    }

}
