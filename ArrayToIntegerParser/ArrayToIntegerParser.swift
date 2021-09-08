//
//
// ArrayToIntegerParser.swift
// ArrayToIntegerParser
//
// Created by Alexandre Hu (HU JEN EN) on 2021/9/8
// Copyright © 2021 Alexandre Hu. All rights reserved.
//
        

import Foundation

final class ArrayToIntegerParser {
    
    public func atoi_LC(with input: String) -> Int {
        return atoi_LC(input: input)
    }
    
    internal func atoi_LC(input: String) -> Int {
        var result = 0
        var notSignedValue = 0
        var signChanged: Bool = false
        var isPositive: Bool = true
        let inputArray = Array(input)
        let trimmedArray = trimLeadingSpaceChars(array: inputArray)
        let hasLeadingDigit = checkArrayHasLeadingDigit(array: inputArray)
        outerLoop: for c in trimmedArray {
            switch checkInputCharacterType(with: c) {
                case .isSpaceChar:
                    if signChanged || hasLeadingDigit {
                        break outerLoop
                    }

                case .isPositiveSignChar:
                    if hasLeadingDigit { break outerLoop }
                    if !signChanged {
                        signChanged = true
                    } else {
                        break outerLoop
                    }

                case .isNegativeSignChar:
                    if hasLeadingDigit { break outerLoop }
                    if !signChanged {
                        signChanged = true
                        isPositive = false
                    } else {
                        break outerLoop
                    }

                case .isNumericChar:
                    notSignedValue = calculateValue(with: c, priviousValue: notSignedValue)
                    if !isPositive {
                        result = -(notSignedValue)
                    } else {
                        result = notSignedValue
                    }
                    
                    if checkIfExceedInt32Bounds(with: result) {
                        result = result > 0 ? Int.int32_max : Int.int32_min
                        break outerLoop
                    }

                default:
                    break outerLoop
            }
        }

        return result
    }
    
    internal func checkArrayHasLeadingDigit(array: [Character]) -> Bool {
        var result: Bool = false
        for c in array {
            if !c.isWhitespace && !(c.isASCII && c.isNumber) {
                break
            } else if (c.isASCII && c.isNumber) {
                result = true
                break
            }
        }
        
        return result
    }

    internal func calculateValue(with addedDigit: Character, priviousValue: Int) -> Int {
        var result = priviousValue
        if addedDigit.isASCII && addedDigit.isNumber {
            result = (result * 10) + (addedDigit.wholeNumberValue ?? 0)
        }
        
        return result
    }

    internal func trimLeadingSpaceChars(array: [Character]) -> [Character] {
        var result: [Character] = []
        var keepTrimmingFlag: Bool = true
        for c in array {
            if !c.isWhitespace {
                keepTrimmingFlag = false
            }
            if !keepTrimmingFlag {
                result.append(c)
            }
        }
        
        return result
    }

    internal func checkIfExceedInt32Bounds(with value: Int) -> Bool {
        return value > Int.int32_max || value < Int.int32_min
    }

    internal func checkInputCharacterType(with char: Character) -> CharacterTypes {
        var characterType: CharacterTypes = .other
        
        if char.isASCII && char.isNumber {
            characterType = .isNumericChar
        } else if char == "+" {
            characterType = .isPositiveSignChar
        } else if char == "-" {
            characterType = .isNegativeSignChar
        } else if char.isWhitespace {
            characterType = .isSpaceChar
        }
        
        return characterType
    }
    
    internal enum CharacterTypes {
        case isNumericChar
        case isPositiveSignChar
        case isNegativeSignChar
        case isSpaceChar
        case other
    }
}
