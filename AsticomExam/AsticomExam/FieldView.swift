//
//  FieldView.swift
//  AsticomExam
//
//  Created by Bryan Vivo on 10/22/20.
//

import UIKit

class FieldView: UIView {
    
    private var placeHolder: String?
    private var keyboardType: UIKeyboardType = .default
    private var isSecure: Bool = false
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = placeHolder
        textField.keyboardType = keyboardType
        textField.isSecureTextEntry = isSecure
        textField.inputAccessoryView = fieldToolbar
        
        if placeHolder?.localizedCaseInsensitiveContains("MPIN") ?? false {
            textField.delegate = self
        }
        
        return textField
    }()
    
    private lazy var fieldToolbar: UIToolbar = {
        let toolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.dismissKeyboard))
        toolbar.items = [flexSpace, done]
        return toolbar
    }()
    
    
    init(placeHolder: String = "", keyboardType: UIKeyboardType = .default, isSecure: Bool = false) {
        self.placeHolder = placeHolder
        self.keyboardType = keyboardType
        self.isSecure = isSecure
        super.init(frame: CGRect.zero)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func textFieldText() -> String? {
        return textField.text
    }
    
    private func setupUI() {
        let lineView = UIView()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = .gray
        
        self.addSubview(textField)
        self.addSubview(lineView)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: self.topAnchor),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            lineView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    @objc private func dismissKeyboard() {
        textField.resignFirstResponder()
    }
    
    
}

extension FieldView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        let (result, newText) = currentText.limitCharacters(replacementString: string, maxLength: 4, range: range)
        
        if newText != textField.text {
            textField.text = newText
        }
        
        return result
    }
}

extension String {
    func limitCharacters(replacementString: String, maxLength: Int, range: NSRange) -> (Bool, String) {
        let currentText = self
        let currentCharacterCount = currentText.count
        if range.length + range.location > currentCharacterCount {
            return (false, currentText)
        }
        let newLength = currentCharacterCount + replacementString.count - range.length
        if newLength < maxLength {
            return (true, currentText)
        } else {
            let newText = String(format: "%@%@", currentText, replacementString)
            let index = newText.index(newText.startIndex, offsetBy: maxLength)
            let subString = String(newText[..<index])
            return (false, subString)
        }
    }
}
