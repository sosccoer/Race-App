//
//  NickNameViewController.swift
//  sRace
//
//  Created by lelya.rumynin@gmail.com on 26.07.23.
//

import UIKit

class NickNameViewController: UIViewController {

    @IBOutlet weak var nickNameTextField: UITextField!
        
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    var previousSettings = SettingsClass.sharedInfo.initialSettings
    lazy var settings: [TypeOfCell] = previousSettings
    
    
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
    
    
    @IBAction func savChanges(_ sender: Any) {
    
        NotificationCenter.default.post(
            name: NSNotification.Name("updateUserName"),
            object: nil,
            userInfo: ["Имя пользователя": nickNameTextField.text ?? ""]
        )
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}



extension NickNameViewController: UITextFieldDelegate{
    
   
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         if textField == nickNameTextField {
            nickNameTextField.endEditing(true)
        }
        return true
    }
    
    
  

}
