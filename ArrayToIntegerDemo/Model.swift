//
//
// Model.swift
// ArrayToIntegerDemo
//
// Created by Alexandre Hu (HU JEN EN) on 2021/9/8
// Copyright © 2021 Alexandre Hu. All rights reserved.
//
        

import Foundation

struct Model {
    var inputString: String = ""
    var integerFromInput: Int = 0
    var outputString: String {
        return integerFromInput.description
    }
}
