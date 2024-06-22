//
//  ViewController.swift
//  A calculator
//
//  Created by 이태규 on 2023/04/12.
//

import UIKit

class ViewController: UIViewController {
    var typeNum : Int = 0
    var firstNumber : Double = 0
    var secondNumber : Double = 0
    @IBOutlet weak var number1: UILabel!
    @IBOutlet weak var number: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clalculationButton(_ sender: UIButton) {
        switch sender.tag{
        case 0:
            number.text = "0"
        case 3...6:
            typeNum = sender.tag
            firstNumber = Double(number.text!)!
            number1.text = number.text
            number.text = "0"
        case 1:
            number.text = String(Double(number.text!)! * -1)
        case 2:
            typeNum = sender.tag
            firstNumber = Double(number.text!)!
            number.text = "0"
            number.text = String(firstNumber * 0.01)
        case 7:
            secondNumber = Double(number.text!)!
            number1.text = "0"
            switch typeNum{
            case 6:
                number.text = removePoint(num: firstNumber + secondNumber)
            case 5:
                number.text = removePoint(num: firstNumber - secondNumber)
            case 4:
                number.text = removePoint(num: firstNumber * secondNumber)
            case 3:
                number.text = removePoint(num: firstNumber / secondNumber)
            default: break
            }
        default: break
        }
    }
    
    @IBAction func numberButton(_ sender: UIButton) {
        
        switch sender.tag {
        case 0 ..< 10:
            if(number.text == "0") {
                number.text = String(sender.tag)
            } else {
                number.text = number.text! + String(sender.tag)
            }
        case 11:
            if !(number.text?.contains("."))! {
                number.text = number.text! + "."
            }
        default: break
        }
    }
    
    func removePoint(num: Double) -> String{
        var floatNumString = String(num)
        
        while floatNumString.last == "0"{
            floatNumString.removeLast()
        }
        if floatNumString.last == "."{
            floatNumString.removeLast()
        }
        return floatNumString
    }
    
    
}
// 아니 이거 왜 새로운 파일 채인지 안떠
