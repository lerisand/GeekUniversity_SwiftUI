//
//  LoginViewController.swift
//  Vkontakte
//
//  Created by Lera on 20.12.20.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginPageScrollView: UIScrollView!
    
    @IBOutlet weak var appNameTitle: UILabel!
    
    @IBOutlet weak var loginField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginActionButton: UIButton!
    
    @IBAction func accessRecoveryButton(_ sender: Any) {}
    
    @IBAction func myUnwindAction (unwindSegue: UIStoryboardSegue) {}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        loginPageScrollView.addGestureRecognizer(tapGesture)
    }
    
    @objc func keyboardWillShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0)
        
        loginPageScrollView.contentInset = contentInsets
        loginPageScrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        loginPageScrollView.contentInset = UIEdgeInsets.zero
        loginPageScrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func hideKeyboard() {
        loginPageScrollView.endEditing(true)
    }
    
    private func checkLoginInfo() -> Bool {
        guard let loginText = loginField.text else { return false }
        guard let pwdText = passwordField.text else { return false }
        
        if loginText == "1", pwdText == "1" {
            print("Успешно!")
            return true
        }
        else {
            print("Не успешно")
            return false
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "LogInCorrectSegue" {
            if checkLoginInfo() {
                return true
            }
            else {
                showLoginError()
                return false
            }
        }
        
        return true
    }
    
    private func showLoginError() {
        let alert = UIAlertController(title: "Ошибка!", message: "Логин и/или пароль не верны", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func LogInActionButton(_ sender: UIButton) {
    }
    
}
    

