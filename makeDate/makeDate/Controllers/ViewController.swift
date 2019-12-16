//
//  ViewController.swift
//  makeDate
//
//  Created by Mohammed Drame on 12/3/19.
//  Copyright © 2019 Mo Drame. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // IBOutlets
    @IBOutlet weak var userNameLogIn: LoginPageTextFields!
    @IBOutlet weak var passWordLogIn: LoginPageTextFields!
    
    @IBOutlet weak var baseUIVieew: CustomUIView!
    @IBOutlet weak var secondBaseUIView: CustomUIView!
    
    @IBOutlet weak var fingerPrintOutlet: UIButton!
    @IBOutlet weak var logInLableOutlet: UILabel!
    
    @IBOutlet weak var registerButtonOutlet: UIButton!
    
    
    // Delegates stuff
    func textfieldSDelegates() {
        userNameLogIn.delegate = self
        passWordLogIn.delegate = self
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        unhideFingerprint()
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        hideFingerPrint()
//
//    }
    
    
    // UIView layout stuffs
    func uiviewCall() {
        
        baseUIVieew.baseUIViewlayoutStuff()
        secondBaseUIView.secondBaseUIViewlayoutStuff()
        
    }
    
    func registerButtonLayout() {
        registerButtonOutlet.layer.cornerRadius = 5
    }
    
    
    // uitextfield layout stuffs
    func textFieldCall() {
        userNameLogIn.textFieldplaceHolder(placeHolderText: "User", color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3008637764))
        passWordLogIn.textFieldplaceHolder(placeHolderText: "Pass", color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.296737456))
    }
    
    
    
    // Hide finger print when view load
    func hideFingerPrint() {
        
        fingerPrintOutlet.isHidden = true
        logInLableOutlet.isHidden = true
           
            UIView.animate(withDuration: 0.5) {
                self.fingerPrintOutlet.center.y = 700
                
            }
    }
    
    
    
    // UNHide fingerprint if user start to edit the password
    func unhideFingerprint() {
        
                fingerPrintOutlet.isHidden = false
                logInLableOutlet.isHidden = false
            
            UIView.animate(withDuration: 0.5) {
                self.fingerPrintOutlet.center.y = 400
     
        
    }
    }
    
    
//
//    func userNameLogInFunctionCalls(view: UIView) {
//        // edit userName textield here
//        userNameLogIn.textFieldplaceHolder(placeHolderText: "User Name", color: #colorLiteral(red: 0.8821972863, green: 0.9148316062, blue: 0, alpha: 0.5))
//
//    }
//
//    func passWordLogInFunctionCalls(view: UIView) {
//           // edit passWord textfield here
//        passWordLogIn.textFieldplaceHolder(placeHolderText: "PassWord", color: #colorLiteral(red: 0.8821972863, green: 0.9148316062, blue: 0, alpha: 0.5) )
//
//       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiviewCall()
        // textFieldOutlet call
        textFieldCall()
        
        hideFingerPrint()
        registerButtonLayout()
        
        gesture()
//        // calling and setting textfield as a paremeter so layers  in the function can access it
//        userNameLogInFunctionCalls(view: userNameLogIn)
//        passWordLogInFunctionCalls(view: passWordLogIn)
//        
//     
        
        
      textfieldSDelegates()
        // Do any additional setup after loading the view.
    }
    
    
    
    // Actions
    @IBAction func logInpress(_ sender: UIButton) {
        // verify user and perform segue if successful. else shake textfield and pup an error message
        
        
    }
    
    
    @IBAction func register(_ sender: UIButton) {
        performSegue(withIdentifier: "toRegister", sender: self)
    }
    
    // Unwind from register page
@IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
    
    
    
    func gesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tap))
       secondBaseUIView.addGestureRecognizer(tapGesture)
    
    }
    
    @objc func tap() {
//       unhideFingerprint()
        self.view.endEditing(true)
    }
    
    
    
    
    
    
    
    
}
