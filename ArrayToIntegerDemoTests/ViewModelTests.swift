//
//
// ViewModelTests.swift
// ArrayToIntegerDemoTests
//
// Created by Alexandre Hu (HU JEN EN) on 2021/9/8
// Copyright © 2021 Alexandre Hu. All rights reserved.
//
        

import XCTest
@testable import ArrayToIntegerDemo

class ViewModelTests: XCTestCase {

    private var viewModel = ViewModel()

    func testInputIsPositiveAndNotExceededInt32Bound() {
        let input: String = "5566"
        let output = atoi_LeetCode(input: input)
        XCTAssertEqual(output, 5566)
    }
    
    func testInputIsNegativeAndNotExceededInt32Bound() {
        let input: String = "-5566"
        let output = atoi_LeetCode(input: input)
        XCTAssertEqual(output, -5566)
    }
    
    func testInputIsPositiveAndNotExceededInt32BoundButHaveLeadingElement() {
        let input: String = "a5566"
        let output = atoi_LC(input: input)
        XCTAssertEqual(output, 0)
    }
    
    func testInputIsPositiveAndNotExceededInt32BoundButHaveTrailingElement() {
        let input: String = "5566a"
        let output = atoi_LeetCode(input: input)
        XCTAssertEqual(output, 5566)
    }
    
    func testInputIsPositiveAndExceededInt32Bound() {
        let input: String = "91283472332"
        let output = atoi_LeetCode(input: input)
        XCTAssertEqual(output, 2147483647)
    }
    
    func testInputIsNegativeAndExceededInt32Bound() {
        let input: String = "-91283472332"
        let output = atoi_LeetCode(input: input)
        XCTAssertEqual(output, -2147483648)
    }

}
