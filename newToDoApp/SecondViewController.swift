//
//  SecondViewController.swift
//  newToDoApp
//
//  Created by Angela Tuzson on 12/26/17.
//  Copyright © 2017 Andrew Tuzson. All rights reserved.
//

import UIKit
import QuartzCore

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextField()
        self.inputTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    func configureTextField() {
        inputTextField.layer.shadowColor = UIColor.black.cgColor
        inputTextField.layer.shadowOpacity = 0.3
        inputTextField.layer.shadowOffset = CGSize(width: -1, height: 5)
        inputTextField.layer.shadowRadius = 5
    }
    
    @IBAction func addItem(_ sender: Any) {
        
        if inputTextField.text != "" {
            list.append(inputTextField.text!)
            inputTextField.text = ""
            inputTextField.placeholder = "Item Title"
        }
        
    }
    
}










