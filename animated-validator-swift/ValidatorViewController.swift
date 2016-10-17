//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    //Constraints for text fields
    var emailTextFieldCenterXConstraint: NSLayoutConstraint!
    var emailTextFieldWidthConstraint: NSLayoutConstraint!
    var emailTextFieldTopConstraint: NSLayoutConstraint!
    
    var emailConfirmationCenterXConstraint: NSLayoutConstraint!
    var emailConfirmationWidthConstraint: NSLayoutConstraint!
    var emailConfirmationTopConstraint: NSLayoutConstraint!
    
    var phoneCenterXConstraint: NSLayoutConstraint!
    var phoneWidthConstraint: NSLayoutConstraint!
    var phoneTopConstraint: NSLayoutConstraint!
    
    var passwordCenterXConstraint: NSLayoutConstraint!
    var passwordWidthConstraint: NSLayoutConstraint!
    var passwordTopConstraint: NSLayoutConstraint!
    
    var passConfirmCenterXConstraint: NSLayoutConstraint!
    var passConfirmWidthConstraint: NSLayoutConstraint!
    var passConfirmTopConstraint: NSLayoutConstraint!
    
    var submitButtonCenterXConstraint: NSLayoutConstraint!
    var submitButtonTopConstraint: NSLayoutConstraint!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.submitButton.isEnabled = false
        
        createInitialConstraints()
        
    }
    
    func createInitialConstraints () {
        let spacing: CGFloat = 30
        let textFieldWidthPercent: CGFloat = 0.5
        let borderWidth: CGFloat = 2
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextFieldCenterXConstraint = self.emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        emailTextFieldCenterXConstraint.isActive = true
        emailTextFieldWidthConstraint = self.emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: textFieldWidthPercent)
        emailTextFieldWidthConstraint.isActive = true
        emailTextFieldTopConstraint = self.emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        emailTextFieldTopConstraint.isActive = true
        emailTextField.layer.borderWidth = borderWidth
        
        emailConfirmationTextField.translatesAutoresizingMaskIntoConstraints = false
        emailConfirmationCenterXConstraint = self.emailConfirmationTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        emailConfirmationCenterXConstraint.isActive = true
        emailConfirmationWidthConstraint = self.emailConfirmationTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: textFieldWidthPercent)
        emailConfirmationWidthConstraint.isActive = true
        emailConfirmationTopConstraint = self.emailConfirmationTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: spacing)
        emailConfirmationTopConstraint.isActive = true
        emailConfirmationTextField.layer.borderWidth = borderWidth
        
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneCenterXConstraint = phoneTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        phoneCenterXConstraint.isActive = true
        phoneWidthConstraint = phoneTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: textFieldWidthPercent)
        phoneWidthConstraint.isActive = true
        phoneTopConstraint = phoneTextField.topAnchor.constraint(equalTo: emailConfirmationTextField.bottomAnchor, constant: spacing)
        phoneTopConstraint.isActive = true
        phoneTextField.layer.borderWidth = borderWidth
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordCenterXConstraint = passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        passwordCenterXConstraint.isActive = true
        passwordWidthConstraint = passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: textFieldWidthPercent)
        passwordWidthConstraint.isActive = true
        passwordTopConstraint = passwordTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: spacing)
        passwordTopConstraint.isActive = true
        passwordTextField.layer.borderWidth = borderWidth
        
        passwordConfirmTextField.translatesAutoresizingMaskIntoConstraints = false
        passConfirmCenterXConstraint = passwordConfirmTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        passConfirmCenterXConstraint.isActive = true
        passConfirmWidthConstraint = passwordConfirmTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: textFieldWidthPercent)
        passConfirmWidthConstraint.isActive = true
        passConfirmTopConstraint = passwordConfirmTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: spacing)
        passConfirmTopConstraint.isActive = true
        passwordConfirmTextField.layer.borderWidth = borderWidth
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButtonCenterXConstraint = submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        submitButtonCenterXConstraint.isActive = true
        submitButtonTopConstraint = submitButton.topAnchor.constraint(equalTo: view.bottomAnchor)
        submitButtonTopConstraint.isActive = true
        submitButton.layer.borderWidth = borderWidth
        
        
    }
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case emailTextField:
            if let text = emailTextField.text {
                reactToUserInput(myView: emailTextField, inputValid: checkForValid(email: text), centerX: emailTextFieldCenterXConstraint)
            }
        case emailConfirmationTextField:
            if let text = emailConfirmationTextField.text {
                 reactToUserInput(myView: emailConfirmationTextField, inputValid: checkForMatching(email: text), centerX: emailConfirmationCenterXConstraint)
            }
        case phoneTextField:
            if let text = phoneTextField.text {
                reactToUserInput(myView: phoneTextField, inputValid: checkForValid(phoneNumber: text), centerX: phoneCenterXConstraint)
            }
        case passwordTextField:
            if let text = passwordTextField.text {
                reactToUserInput(myView: passwordTextField, inputValid: checkForValid(password: text), centerX: passwordCenterXConstraint)
            }
        case passwordConfirmTextField:
            if let text = passwordConfirmTextField.text {
                reactToUserInput(myView: passwordConfirmTextField, inputValid: checkForMatching(password: text), centerX: passConfirmCenterXConstraint)
            }
        default:
            print("got to break in switch")
            break
        }
        
        
    }
    
    func wiggle(view myView: UIView, centerX: NSLayoutConstraint) {
        var newCenterX = centerX
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseInOut, animations: {
            centerX.isActive = false
            newCenterX = myView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 5)
            newCenterX.isActive = true
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        
        UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveEaseInOut, animations: {
            newCenterX.isActive = false
            newCenterX = myView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -5)
            newCenterX.isActive = true
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animate(withDuration: 0.1, delay: 0.3, options: .curveEaseInOut, animations: {
            newCenterX.isActive = false
            centerX.isActive = true
            self.view.layoutIfNeeded()
            }, completion: nil)
    }
    
    func changeColor(ofView myView: UIView, color: UIColor) {
        UIView.animate(withDuration: 0.2, animations: {
            myView.backgroundColor = color
        })
    }
    
    func allTextFieldsGreen () -> Bool {
        let green = UIColor.green
        return emailTextField.backgroundColor == green && emailConfirmationTextField.backgroundColor == green && phoneTextField.backgroundColor == green && passwordTextField.backgroundColor == green && passwordConfirmTextField.backgroundColor == green
    }
    
    func reactToUserInput(myView: UITextField, inputValid: Bool, centerX: NSLayoutConstraint) {
        if !inputValid {
            wiggle(view: myView, centerX: centerX)
            changeColor(ofView: myView, color: .red)
        } else {
            changeColor(ofView: myView, color: .green)
        }
        
        if allTextFieldsGreen() {
            UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseOut, animations: {
                self.submitButtonTopConstraint.isActive = false
                self.submitButtonTopConstraint = self.submitButton.topAnchor.constraint(equalTo: self.passwordConfirmTextField.bottomAnchor, constant: 30)
                self.submitButtonTopConstraint.isActive = true
                self.view.layoutIfNeeded()
                }, completion: nil)
            submitButton.isEnabled = true
        }
    }

    func checkForValid(email input: String) -> Bool {
        var hasAtSign = false
        var hasPeriod = false
        
        let characters = Array(input.characters)
        
        for char in characters {
            switch char {
            case "@": hasAtSign = true; break
            case ".": hasPeriod = true; break
            default: break
            }
        }
        return hasAtSign && hasPeriod
    }
    
    func checkForValid(phoneNumber number: String) -> Bool {
        let validNumbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8" , "9"]
        
        let numbersAsArray = Array(number.characters)
        
        if numbersAsArray.count < 7 {
            return false
        }
        
        for num in numbersAsArray {
            var numIsValid = false
            for validNum in validNumbers {
                if String(num) == validNum {
                    numIsValid = true
                }
            }
            if !numIsValid {
                return false
            }
        }
        return true
    }
    
    func checkForValid(password input: String) -> Bool {
        if input.characters.count > 5 {
            return true
        }
        return false
    }
    
    func checkForMatching(email input: String) -> Bool {
        return self.emailTextField.text == input
    }
    
    func checkForMatching(password input: String) -> Bool {
        if let text = passwordTextField.text {
            if text == input {
                return true
            }
        }
        return false
    }

}
