//
//  ViewController.swift
//  calculator app ios
//
//  Created by Anmol Gupta on 08/03/24.
//

import UIKit

class ViewController: UIViewController {

    var firstNum: String = "";

    var opertion: String = "";

    var secondNumber: String = "";

    var haveResult: Bool = false;

    var resultNumber: String = "";

    var numAfterResult: String = "";

    @IBOutlet weak var numOnScreen: UILabel!


    @IBAction func numPressed(_ sender: UIButton) {
        if opertion == "" {
            firstNum += String(sender.tag);
            numOnScreen.text = firstNum;
        } else if opertion != "" && !haveResult {
            secondNumber += String(sender.tag);
            numOnScreen.text = (numOnScreen.text)! + secondNumber;
        } else if opertion != "" && haveResult {
            numAfterResult += String(sender.tag);
            numOnScreen.text = (numOnScreen.text)!  + numAfterResult;
        }
    }
    
    
    
    @IBOutlet weak var symbol: UILabel!
    
    @IBAction func add(_ sender: UIButton) {
        opertion = "+";
        numOnScreen.text = (numOnScreen.text)! +  opertion;
    }
    
    @IBAction func subtract(_ sender: UIButton) {
        opertion = "-";
        numOnScreen.text = (numOnScreen.text)! +  opertion;
    }
    
    @IBAction func mul(_ sender: UIButton) {
        opertion = "*";
        numOnScreen.text = (numOnScreen.text)! +  opertion;
    }
    
    
    @IBAction func div(_ sender: UIButton) {
        opertion = "/";
        numOnScreen.text = (numOnScreen.text)! +  opertion;
    }
    
    @IBAction func euqals(_ sender: UIButton) {
        resultNumber = String(doOpreation())
        let numArray = resultNumber.components(separatedBy: ".")
        if numArray[1] == "0" {
            numOnScreen.text = numArray[0];
        } else {
            numOnScreen.text = resultNumber;
        }
        numAfterResult = "";
        symbol.text = "";
    }
    
    @IBAction func clear(_ sender: UIButton) {
    
         firstNum = "";

         opertion = "";

         secondNumber = "";

         haveResult = false;

         resultNumber = "";

         numAfterResult = "";
        
        numOnScreen.text = "0";
        symbol.text = "";
    }
    
    @IBOutlet var calcButton: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for button in calcButton {
            button.layer.cornerRadius = button.frame.size.height/2;
            button.titleLabel?.font = UIFont(name:"Sytem", size: 24)
        }
    }
        
        func doOpreation() -> Double {
            if opertion == "+" {
                if !haveResult {
                    haveResult = true;
                    return Double(firstNum)! + Double(secondNumber)!
                } else {
                    return Double(resultNumber)! + Double(numAfterResult)!
                }
            } else if opertion == "-" {
                if !haveResult {
                    haveResult = true;
                    return Double(firstNum)! - Double(secondNumber)!
                } else {
                    return Double(resultNumber)! - Double(numAfterResult)!
                }
            }  else if opertion == "*" {
                if !haveResult {
                    haveResult = true;
                    return Double(firstNum)! * Double(secondNumber)!
                } else {
                    return Double(resultNumber)! * Double(numAfterResult)!
                }
            }  else if opertion == "/" {
                if !haveResult {
                    haveResult = true;
                    return Double(firstNum)! / Double(secondNumber)!
                } else {
                    return Double(resultNumber)! / Double(numAfterResult)!
                }
            }
            return 0;
        }
    
}

