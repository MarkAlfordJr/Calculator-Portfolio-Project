//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    //MARK: - data intializers
    
    //boolean to tell if UIlabel input is done being typed for now
    private var isNumberFinishedTyping: Bool = true
    
    //access CalculatoeBrain's code
    private var calculator = CalculatorBrain()
    
    //getter variable to equal displayLabel's value {{
    private var displayValue: Double {
        get{
            guard let currentDisplayLabel = Double(displayLabel.text!) else {
                fatalError("cannot convert to double")
            }
            return currentDisplayLabel
        }
        set{
            displayLabel.text! = String(newValue)
        }
    }
    //}}
    
    //setup UI element label
    @IBOutlet internal weak var displayLabel: UILabel!
    
    
    //MARK: - button functionality
    
    //ends input editing, calls calculate method with button symbol as parameter
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isNumberFinishedTyping = true
        calculator.setNumber(displayValue)
       
        if let calcMethod = sender.currentTitle {
 
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
    
    //adds numbers to the UILabel input
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //adds to displayLabel the numbers you type in {{
        if let numValue = sender.currentTitle {
            if isNumberFinishedTyping {
                displayLabel.text = numValue
                isNumberFinishedTyping = false
            } else {
                //checks if a decimal has been pressed, and if so, NO MORE decimals {{
                if numValue == "."{
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                //}}
                displayLabel.text = displayLabel.text! + numValue
            }
        }
        //}}
    }
}

