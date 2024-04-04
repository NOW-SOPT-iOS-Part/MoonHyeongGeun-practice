//
//  LoginViewController.swift
//  SOPT iOS Week1
//
//  Created by Chandrala on 4/1/24.
//

import Foundation
import UIKit

final class LoginViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel(
            frame: CGRect(
                x: 69,
                y: 161,
                width: 236,
                height: 44
            )
        )
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.pretendardFont(
            weight: 700,
            size: 18
        )
        return label
    }()
    
    private let switchLabel: UILabel = {
        let label = UILabel(
            frame: CGRect(
                x: 120,
                y: 520,
                width: 130,
                height: 50
            )
        )
        label.text = "게스트로 로그인"
        label.font = UIFont.pretendardFont(
            weight: 600,
            size: 18
        )
        label.textColor = .black
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField(
            frame: CGRect(
                x: 20,
                y: 276,
                width: 335,
                height: 52
            )
        )
        textField.setTextField(
            forPlaceholder: "아이디",
            forCornerRadius: 3
        )
        textField.addPadding(
            left: 23
        )
        textField.font = UIFont.pretendardFont(
            weight: 600,
            size: 14
        )
        textField.backgroundColor = UIColor(
            red: 221/255,
            green: 222/255,
            blue: 227/255,
            alpha: 1
        )
        textField.returnKeyType = .next // 키보드의 return키를 next로 변경
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(
            frame: CGRect(
                x: 20,
                y: 335,
                width: 335,
                height: 52
            )
        )
        textField.setTextField(
            forPlaceholder: "비밀번호",
            forCornerRadius: 3
        )
        textField.addPadding(
            left: 23
        )
        textField.font = UIFont.pretendardFont(
            weight: 600,
            size: 14
        )
        textField.backgroundColor = UIColor(
            red: 221/255,
            green: 222/255,
            blue: 227/255,
            alpha: 1
        )
        textField.returnKeyType = .continue // 키보드의 return키를 continue로 변경
        return textField
    }()
    
    //let -> lazy var로 바꾸니까 51 line self 경고가 사라졌다.
    private lazy var loginButton: UIButton = {
        let button = UIButton(
            frame: CGRect(
                x: 20,
                y: 422,
                width: 335,
                height: 58
            )
        )
        button.backgroundColor = UIColor(
            red: 255/255,
            green: 111/255,
            blue: 15/255,
            alpha: 1
        )
        button.setTitle(
            "로그인하기",
            for: .normal
        )
        button.setTitleColor(
            .white,
            for: .normal
        )
        button.titleLabel?.font = UIFont.pretendardFont(
            weight: 700,
            size: 18
        )
        button.makeRoundBorder(
            cornerRadius: 6
        )
        button.addTarget(
            self,
            action: #selector(
                loginButtonDidTap
            ),
            for: .touchUpInside
        )
        return button
    }()
    
    private lazy var guestSwitch: UISwitch = {
        let guestSwitch = UISwitch(
            frame: CGRect(
                x: 240,
                y: 530,
                width: 50,
                height: 50
            )
        )
        guestSwitch.isOn = false
        return guestSwitch
    }()
    
    private func pushToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        if guestSwitch.isOn {
            welcomeVC.id = "Guest"
        } else {
            welcomeVC.id = idTextField.text
        }
        self.navigationController?.pushViewController(
            welcomeVC,
            animated: true
        )
    }
    
    @objc private func loginButtonDidTap(){
        idTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        pushToWelcomeVC()
    }
    
    @objc func toggleDarkMode(
        sender: UISwitch
    ) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubviews(
            titleLabel,
            idTextField,
            passwordTextField,
            loginButton,
            guestSwitch,
            switchLabel
        )
        idTextField.delegate = self
        passwordTextField.delegate = self
    }
}

// 키보드의 리턴 키에 표시되는 텍스트를 결정
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        if textField == idTextField {
            passwordTextField.becomeFirstResponder() // 키보드 포커스를 idTextField에서 passwordTextField로 이동
        }
        else if textField == passwordTextField {
            loginButtonDidTap() // passwordTextField의 포커스를 loginButton() 활성화로 전환
        }
        return true
    }
}
