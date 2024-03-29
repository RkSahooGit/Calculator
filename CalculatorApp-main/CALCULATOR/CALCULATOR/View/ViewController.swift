//
//  ViewController.swift
//  CALCULATOR
//
//  Created by Rakesh Kumar Sahoo on 09/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputLable: UILabel!
    @IBOutlet weak var resultLable: UILabel!
    
    var workings:String = ""

    //To clear all values from lables
    func clearAll(){
        workings = ""
        inputLable.text = ""
        resultLable.text = ""
    }
    
    //assign symbols as string to show on label by concanating each Symbol
    func addToWorkings(value:String){
        workings+=value
        inputLable.text = workings
    }
    
        //This function is for equalTo(=) expression for all types of calculation
    func formatResult(result: Double)-> String{
        
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        }else{
            return String(format: "%.2f", result)
        }
    }
    
    //This cheaks input is valid or not
    func validInput()-> Bool{
        
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings{
            if(specialCharacter(char: char)){
                funcCharIndexes.append(count)
            }
            count+=1
        }
        var previous: Int = -1
        
        for index in funcCharIndexes{
            if (index == 0){
                return false
            }
            if (index == workings.count - 1){
                return false
            }
            if (previous != -1){
                if(index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    func specialCharacter(char: Character)-> Bool{
        
        if(char == "*"){
            return true
        }
        if(char == "/"){
            return true
        }
        if(char == "+"){
            return true
        }
        if(char == "-"){
            return true
        }
        if(char == "%"){
            return true
        }
        if(char == "."){
            return true
        }
        return false
    }
    
    
    @IBAction func zero(_ sender: Any) {
       
        addToWorkings(value: "0")
    }
    
    @IBAction func one(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    @IBAction func two(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    @IBAction func three(_ sender: Any) {
        addToWorkings(value: "3")
    }
    @IBAction func four(_ sender: Any) {
        addToWorkings(value: "4")
    }
    @IBAction func five(_ sender: Any) {
        addToWorkings(value: "5")
    }
    @IBAction func six(_ sender: Any) {
        addToWorkings(value: "6")
    }
    @IBAction func seven(_ sender: Any) {
        addToWorkings(value: "7")
    }
    @IBAction func eight(_ sender: Any) {
        addToWorkings(value: "8")
    }
    @IBAction func nine(_ sender: Any) {
        addToWorkings(value: "9")
    }
    @IBAction func decimalPoint(_ sender: Any) {
        addToWorkings(value: ".")
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    @IBAction func plus(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    @IBAction func minus(_ sender: Any) {
        addToWorkings(value: "-")
    }
    @IBAction func multiply(_ sender: Any) {
        addToWorkings(value: "*")
    }
    @IBAction func division(_ sender: Any) {
        addToWorkings(value: "/")
    }
    
    @IBAction func backDelete(_ sender: Any) {
        
        if(!workings.isEmpty){
            workings.removeLast()
            inputLable.text = workings
        }
    }
    
    @IBAction func percentage(_ sender: Any) {
        addToWorkings(value: "%")
    }
    @IBAction func equalTo(_ sender: Any) {
        
        if(validInput())
        {
            let forPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: forPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            resultLable.text = resultString
        }
        else{
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Can't calculate",
                preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func allClear(_ sender: Any) {
        clearAll()
    }
    
    
    
    
    
    
    
}

