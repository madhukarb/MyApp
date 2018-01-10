//
//  ForgotPasswordViewController.swift
//  MyApp
//
//  Created by Madhukar Bommala on 10/21/17.
//  Copyright © 2017 Madhukar. All rights reserved.
//

import UIKit
import FirebaseAuth

class ForgotPasswordViewController: UIViewController, UIScrollViewDelegate {
    var keyboardAdjusted = false
    var lastKeyboardOffset: CGFloat = 0.0
    
    @IBOutlet weak var ForgotScrollView: UIScrollView!
    @IBOutlet weak var resetEmail: LoginTextFeild!
    @IBOutlet weak var resetMessage: UILabel!
    
    @IBOutlet weak var PasswordResetView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ForgotPasswordViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ForgotScrollView.contentSize = view.bounds.size
        PasswordResetView.center.y = view.frame.height
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 15, options: UIViewAnimationOptions.allowUserInteraction, animations: ({
            self.PasswordResetView.center.y = self.view.frame.height/2
        }), completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.popViewController(animated: false)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if keyboardAdjusted == false {
            lastKeyboardOffset = getKeyboardHeight(notification: notification)
            view.frame.origin.y -= lastKeyboardOffset
            keyboardAdjusted = true
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if keyboardAdjusted == true {
            view.frame.origin.y += lastKeyboardOffset
            keyboardAdjusted = false
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
    }
    
    
    
    @IBAction func PasswordResetCancelled(_ sender: UIButton) {
        performSegue(withIdentifier: "UnwindToLoginFromForgotPassword", sender: nil)
    }
    
    
    @IBAction func resendPassword(_ sender: UIButton) {
        
        if resetEmail.text == nil{
            resetMessage.text = "Please use a valid email ID"
        }
        Auth.auth().sendPasswordReset(withEmail: resetEmail.text!) { (error) in
            var alert = ""
            var message = ""
            if error == nil{
                
                let alert = UIAlertController(title: "Reset sucessful", message: "Follow instruction on email", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .cancel, handler: { (action : UIAlertAction)  in
                    self.performSegue(withIdentifier: "UnwindToLoginFromForgotPassword", sender: nil)
                }))
                self.present(alert, animated: true, completion: nil)
            }
            else{
                alert = (error?.localizedDescription)!
                message = "Retry with proper email ID or contact Admin"
            }
            let resetAlert = UIAlertController(title: alert, message: message, preferredStyle: .alert)
            
            
            resetAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil
            ))
            self.present(resetAlert, animated: true, completion: nil)
        }
        
    }

    
}
