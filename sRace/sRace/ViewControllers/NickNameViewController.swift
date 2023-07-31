//
//  NickNameViewController.swift
//  sRace
//
//  Created by lelya.rumynin@gmail.com on 26.07.23.
//

import UIKit

class NickNameViewController: UIViewController {
    
    @IBOutlet weak var nickNameTextField: UITextField!
    
    @IBOutlet weak var nickNameLabel: UILabel!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    let bottomConstraintConstant: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nickNameTextField.delegate = self
        
        registerKeyboardNotifications()
        
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc
    func keyboardWillShow(_ notification: Foundation.Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        
        let keyboardHeight = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size.height
        
        bottomConstraint.constant = bottomConstraintConstant + keyboardHeight
        view.layoutIfNeeded()
    }
    
    @objc
    func keyboardWillHide(_ notification: Foundation.Notification) {
        
        bottomConstraint.constant = bottomConstraintConstant
        view.layoutIfNeeded()
    }
    
    @objc
    func hideKeyboard() {
        view.endEditing(true)
    }
    
    private func setNickName(_ text: String) {
        
        nickNameLabel.text = "NickName: \(text)"
    }
    
}

extension NickNameViewController: UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == nickNameTextField {
            setNickName(textField.text ?? "")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nickNameTextField {
            nickNameTextField.endEditing(true)
        }
        return true
    }
    
}
