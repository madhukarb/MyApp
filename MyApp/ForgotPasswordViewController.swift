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
        ForgotScrollView.contentSize = view.bounds.size
        PasswordResetView.center.y = view.frame.height
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 15, options: UIViewAnimationOptions.allowUserInteraction, animations: ({
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
    
    @IBAction func resendPassword(_ sender: UIButton) {
        
        if resetEmail.text == nil{
        resetMessage.text = "Please use a valid email ID"
        }
        Auth.auth().sendPasswordReset(withEmail: resetEmail.text!) { (error) in
            print("email sent for password reset")
            self.resetMessage.text = "Password sent to " + self.resetEmail.text! + "\n" + "Redirecting to Login Screen"
            let when = DispatchTime.now() + 3
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.performSegue(withIdentifier: "ResetToLogin", sender: Any?.self)
            }
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
