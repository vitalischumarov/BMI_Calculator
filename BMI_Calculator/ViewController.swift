//
//  ViewController.swift
//  BMI_Calculator
//
//  Created by Vitali Schumarov on 01.05.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var heigtTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        //change the image of the button
        calculateButton.setImage(UIImage(named: "enter"), for: .normal)

    }

    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let resultCheckingInput = checkInput()
        print(resultCheckingInput)
    }
    
    //in this function I am checking if the user has empty fields or not. If yes, nothing should happen
    func checkInput() -> Bool {
        if heigtTextField.text == "" || nameTextField.text == "" || weightTextField.text == ""{
            print("input error")
            return false
        } else {
            return true
        }
    }
    
    //with this function I close the keyboard, when the user taps somewhere on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

