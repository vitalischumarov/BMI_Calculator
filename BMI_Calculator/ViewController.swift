//
//  ViewController.swift
//  BMI_Calculator
//
//  Created by Vitali Schumarov on 01.05.22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var heigtTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    var name: String = ""
    var height: String = ""
    var weight: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        //change the image of the button
        calculateButton.setImage(UIImage(named: "enter"), for: .normal)
        nameTextField.delegate = self
    }

    
    //MARK: - calculatButton
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let resultCheckingInput = checkInput()
        if resultCheckingInput == true {
            var resultIBM = calculateBMI(isHeight: height, isWeight: weight)
            
            
            
        } else {
            print(resultCheckingInput)
            alertMissingInput()
        }
    }
    
    //with this function I am calculating the BMI value
    func calculateBMI(isHeight: String, isWeight: String) -> String {
        let heightAsFloat = Float(isHeight)!
        let weightAsFloat = Float(isWeight)!
        let bmi = String(format: "%.0f", (weightAsFloat / (heightAsFloat * heightAsFloat)))
        print("the bmi is \(bmi)")
        return bmi
        

    }
    

    //in this function I am checking if the user has empty fields or not. If yes, nothing should    happen
    func checkInput() -> Bool {
        if heigtTextField.text == "" || nameTextField.text == "" || weightTextField.text == ""{
            return false
        } else {
            height = heigtTextField.text!
            name = nameTextField.text!
            weight = weightTextField.text!
            return true
        }
    }
    
    func alertMissingInput() {
        let alert = UIAlertController(title: "Missing input", message: "check the TextFields", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    //with this function I close the keyboard, when the user taps somewhere on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    //with this function I close the keyboard, when the user taps somewhere on the screen
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
    
}

