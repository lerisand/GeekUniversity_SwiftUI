//
//  LoginViewController.swift
//  VkontakteApp
//
//  Created by Lera on 14.12.20.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginScrollView: UIScrollView!
    
    @IBOutlet weak var logo: UILabel!
    
    @IBOutlet weak var loginInput: UITextField!
    
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func forgetPasswordButton(_ sender: Any) {}
    
    @IBAction func loginButtonPressed(_ sender: Any) {
                // Получаем текст логина
                        let login = loginInput.text!
                        // Получаем текст-пароль
                        let password = passwordInput.text!

                        // Проверяем, верны ли они
                        if login == "1" && password == "1" {
                            print("успешная авторизация")
                        } else {
                            print("неуспешная авторизация")
                        }
        }

        @objc func hideKeyboard() {
                self.loginScrollView?.endEditing(true)
            }

        override func viewDidLoad() {
                super.viewDidLoad()

             // Жест нажатия
                let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
                // Присваиваем его UIScrollVIew
            loginScrollView?.addGestureRecognizer(hideKeyboardGesture)
            }

        // Когда клавиатура появляется
           @objc func keyboardWasShown(notification: Notification) {

               // Получаем размер клавиатуры
               let info = notification.userInfo! as NSDictionary
               let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
               let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)

               // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
               self.loginScrollView?.contentInset = contentInsets
            loginScrollView?.scrollIndicatorInsets = contentInsets
           }

           //Когда клавиатура исчезает
           @objc func keyboardWillBeHidden(notification: Notification) {
               // Устанавливаем отступ внизу UIScrollView, равный 0
               let contentInsets = UIEdgeInsets.zero
            loginScrollView?.contentInset = contentInsets
           }

        override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)

                // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
                NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
                // Второе — когда она пропадает
                NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
            }

        override func viewWillDisappear(_ animated: Bool) {
                super.viewWillDisappear(animated)

                NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
                NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
            }
    }
        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


