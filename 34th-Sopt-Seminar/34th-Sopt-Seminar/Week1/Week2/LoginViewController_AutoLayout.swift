import Foundation
import UIKit

final class LoginViewController_Autolayout: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
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
        textField.returnKeyType = .next
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
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
        textField.returnKeyType = .continue
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
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
    
    private func pushToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.id = idTextField.text
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setLayout()
    }
    
    
    private func setLayout() {
        [
            titleLabel,
            idTextField,
            passwordTextField,
            loginButton
        ].forEach { [weak self] view in
            guard let self else {
                return
            }
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(
                view
            )
        }
        
        NSLayoutConstraint.activate([titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     titleLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 161)])
    }
}
//
//#Preview{
//    LoginViewController_Autolayout()
//}
