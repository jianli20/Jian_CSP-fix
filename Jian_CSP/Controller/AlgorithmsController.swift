//
//  Algorithms.swift
//  Jian_CSP
//
//  Created by Li, Jian Hong on 10/26/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit

class Algorithms: UIViewController
{
    
    @IBOutlet weak var algorithmText: UILabel!
    

private func createParagraphStyle() -> NSParagraphStyle
{
    let paragraphStyle : NSMutableParagraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .left
    paragraphStyle.defaultTabInterval = 15
    paragraphStyle.firstLineHeadIndent = 20
    paragraphStyle.headIndent = 35
    
    return paragraphStyle
}

private func setupAlgorithm() -> Void
{
    var algorithmSteps : [String] = []
    
    // TODO: Define algorithm and all steps
    let algorithm :String = "These are instructions to create a project in Java using Eclipse and Github \n"
    let stepOne :String = "First, create project in Eclipse with appropriate packages and classes"
    let stepTwo :String = "Second, create a repository in Github with the same name as the project in Eclipse and commit"
    let stepThree :String = "Third, uncommit the initial commit and go into .gitignore settings. Add bin/, *.class, and DS_Store to gitignore and commit again."
    let stepFour :String = "Fourth, add Controller and Runner class"
    let stepFive :String = "Fifth, add the main method code"
    let stepSix :String = "Sixth, add the start method code to the runner"
    let stepSeven: String = "Seventh, you add whatever code to finish the project."
    
    // TODO: Finish adding all steps to the algorithm
    algorithmSteps = [stepOne, stepTwo, stepThree, stepFour, stepFive, stepSix, stepSeven]
    
    let attributesDictionary = [NSAttributedStringKey.font : algorithmText.font]
    let fullAttributedString = NSMutableAttributedString(string: algorithm, attributes: attributesDictionary)
    
    for step in algorithmSteps
    {
        let bullet :String = "🍗"
        let formattedStep :String = "\n\(bullet) \(step)"
        let attributedStringStep : NSMutableAttributedString = NSMutableAttributedString(string: formattedStep)
        let paragraphStyle = createParagraphStyle()
        
        attributedStringStep.addAttributes([NSAttributedStringKey.paragraphStyle : paragraphStyle], range: NSMakeRange(0,attributedStringStep.length))
        
        fullAttributedString.append(attributedStringStep)
    }
    algorithmText.attributedText = fullAttributedString
    }
}
