//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 오정석 on 19/11/2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        setup()
    }
    
    func setup() {
        view.backgroundColor = UIColor.gray
        
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        
        
        textField.becomeFirstResponder()
    }
    
    //화면의 탭을 감지하는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //텍스트 필드의 입력을 시작할때 호출 (시작할지 말지의 여부 허락하는 것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    //시점
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트 필드의 입력을 시작했다")
    }
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    //텍스트필드 글자 내용이 (한글자 한글자) 입력되거나 지워질때 호출이 되고 (허락)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Int(string) != nil{ //숫자 입력 방지 코드
            return false
        } else { //10글자 이상 입력 방지 코드
            let maxLength = 10
            let currentString: NSString = (textField.text ?? "") as NSString
            let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
    }
    
    //텍스트필드의 엔터키카 눌러지면 다음 동작을 허락할것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    //텍스트필드의 입력이 끝날때 호출(끝날지 말지 허락)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    //텍스트필드의 입력이 실제 끝났을때 호출(시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 입력을 끝냈습니다.")
        textField.text = ""
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
        
    }
    
    
}

