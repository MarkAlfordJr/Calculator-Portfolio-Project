//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Mark Alford on 11/29/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    //1 initialize value for UIlabel purpose
    private var number: Double?
    
    //2 make tuple, to be first UI label input (2.1) and button symbol (2.2)
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    //creates number value
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    //performs calulation on FIRST input number's value
    //returns manipulated number (1) value, based on button symbol (2.2)
    mutating func calculate(symbol: String) -> Double? {
       
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                print(performTwoNumCalculation(n2: n) ?? 0)
                return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    //takes (2.1) first number value, and uses second UIlabel input to perform calulation on both
    //activates when = button is pressed
    func performTwoNumCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
    
}
