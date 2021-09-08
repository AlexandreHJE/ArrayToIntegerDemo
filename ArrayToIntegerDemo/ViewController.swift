//
//
// ViewController.swift
// ArrayToIntegerDemo
//
// Created by Alexandre Hu (HU JEN EN) on 2021/9/8
// Copyright © 2021 Alexandre Hu. All rights reserved.
//
        

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputResultLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    private var viewModel = ViewModel()
    weak var delegate: ViewModelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        submitButton.addTarget(self, action: #selector(submitButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func submitButtonTapped(_ sender: UIButton) {
        guard let text = inputTextField.text else { return }
        transformInput(with: text)
    }
    
    private func transformInput(with string: String) {
        viewModel.arrayToInteger(input: string)
    }
}

extension ViewController: ViewModelDelegate {
    func viewModel(_ viewModel: ViewModel) {
        outputResultLabel.text = viewModel.model.outputString
    }
}

