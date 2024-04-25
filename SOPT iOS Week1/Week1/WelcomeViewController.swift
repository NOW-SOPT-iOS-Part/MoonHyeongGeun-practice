//
//  WelcomeViewController.swift
//  SOPT iOS Week1
//
//  Created by Chandrala on 4/3/24.
//

import Foundation
import UIKit

final class WelcomeViewController: UIViewController {
    
    var id: String? = ""
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(
            frame: CGRect(
                x: 112,
                y: 87,
                width: 150,
                height: 150
            )
        )
        imageView.image = UIImage(
            named: "logo2"
        )
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(
            frame: CGRect(
                x: 140,
                y: 295,
                width: 95,
                height: 60
            )
        )
        label.text = "???님\n반가워요!"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.pretendardFont(
            weight: 800,
            size: 25
        )
        return label
    }()
    
    private let goMainButton: UIButton = {
        let button = UIButton(
            frame: CGRect(
                x: 20,
                y: 426,
                width: 335,
                height: 58
            )
        )
        button.backgroundColor = UIColor(
            resource: .primaryOrange
        )
        button.setTitle(
            "메인으로",
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
        return button
    }()
    
    private lazy var backLoginButton: UIButton = {
        let button = UIButton(
            frame: CGRect(
                x: 20,
                y: 498,
                width: 335,
                height: 58
            )
        )
        button.backgroundColor = UIColor(
            resource: .grey
        )
        button.setTitle(
            "다시 로그인",
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
                backLoginButtonDidTap
            ),
            for: .touchUpInside
        )
        return button
    }()
    
    private func bindID(){
        guard let idText = id else {
            return
        }
        if let id = id {
            self.welcomeLabel.text = "\(id)님\n반가워요!"
        } else {
            self.welcomeLabel.text = "Guest님\n반가워요!"
        }
    }
    
    func setLabelText(
        id: String?
    ) {
        self.id = id
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubviews(
            logoImageView,
            welcomeLabel,
            goMainButton,
            backLoginButton
        )
        bindID()
    }
    
    @objc private func backLoginButtonDidTap(){
        self.navigationController?.popViewController(
            animated: true
        )
    }
}

