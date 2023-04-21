//
//  ViewController.swift
//  Review2calculator
//
//  Created by 이태규 on 2023/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var typeNumber: Int = 0
    @IBOutlet weak var number: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculatorButton(_ sender: UIButton) {
        switch sender.tag{
        case 0:
            number.text = "0"
        case 1:
            number.text = String(datRemove(number1: Double(number.text!)! * -1) )
        case 2:
            number.text = String(datRemove(number1: Double(number.text!)! * 0.01))
        case 3...6:
            firstNumber = Double(number.text!)!
            typeNumber = Int(sender.tag)
            number.text = "0"
        case 7:
            secondNumber = Double(number.text!)!
            switch typeNumber{
            case 6:
                number.text = String(datRemove(number1 : firstNumber + secondNumber))
            case 5:
                number.text = String(datRemove(number1 : firstNumber - secondNumber))
            case 4:
                number.text = String(datRemove(number1 : firstNumber * secondNumber))
            case 3:
                number.text = String(datRemove(number1 : firstNumber / secondNumber))
            default: break
            }
        default: break
        }
    }
    
    @IBAction func numberButton(_ sender: UIButton) {
        switch sender.tag{
        case 0...9:
            if(number.text == "0"){
                number.text = String(sender.tag)
            }else{
                number.text = number.text! + String(sender.tag)
            }
        case 11:
            if !(number.text!.contains(".")) {
                number.text = number.text! + "."
            }
        default: break
        }
    }
    
    func datRemove(number1 : Double) -> String {
        var findDat : String = String(number1)

        while(findDat.last == "0") {
            findDat.removeLast()
        }
        if findDat.last == "." {
            findDat.removeLast()
        }
        return findDat
    }
}
