//
//  AppCompendium.swift
//  Calculator
//
//  Created by Mark Alford on 12/7/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

//MARK: - Features
//1 perform basic functions of a calculator

//MARK: - Patterns
//MVC pattern.
//all logic and data go into a model folder, through methods and properties
//the ViewController ONLY calls these methods

//MARK: - Goals
//OVERALL GOAL
//1 have number buttons load up into UILabel
//2 have top row buttons affect UILabel
//3 setup operation buttons to SAVE first UILabel input, then perform operation with second number input
//4 when = button is pressed, perform operations on first and second number UILabel input.

//MODEL, VIEW, CONTROLLER
//MODEL- handle calculation operations and transformations to UIlabel inputs
//VIEW- design app screen label and buttons
//CONTROLLER- handle number buttons going into UIlabel, and operation buttons affecting UIlabel
