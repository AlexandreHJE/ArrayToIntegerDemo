//
//
// ViewModel.swift
// ArrayToIntegerDemo
//
// Created by Alexandre Hu (HU JEN EN) on 2021/9/8
// Copyright © 2021 Alexandre Hu. All rights reserved.
//


import Foundation
import ArrayToIntegerParser

protocol ViewModelDelegate: AnyObject {
    func viewModel(_ viewModel: ViewModel)
}

final class ViewModel {
    
    weak var delegate: ViewModelDelegate?
    private let parser: ArrayToIntegerParser = ArrayToIntegerParser()
    
    private(set) var model: Model = Model() {
        didSet {
            delegate?.viewModel(self)
        }
    }
    
    public func arrayToInteger(input: String) {
        updateModelContent(input: input)
    }
    
    private func updateModelContent(input: String) {
        let inputString = input
        let integerFromInput = parser.atoi_LC(with: inputString)
        setupModel(with: inputString, integer: integerFromInput)
    }
    
    private func setupModel(with input: String, integer: Int) {
        model = Model(inputString: input, integerFromInput: integer)
    }
}
