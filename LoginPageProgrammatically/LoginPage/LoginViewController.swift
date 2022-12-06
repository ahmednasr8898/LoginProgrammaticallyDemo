//
//  ViewController.swift
//  LoginPageProgrammatically
//
//  Created by Semicolon on 06/12/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    let viewModel = LoginViewModel()
    
    lazy var mainView: LoginView = {
        let view = LoginView(frame: self.view.frame)
        view.backgroundColor = .white
        return view
    }()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userImageViewTapped()
        loginButtonWasTapped()
        registerButtonWasTapped()
        listenToUserName()
    }
    
    private func userImageViewTapped() {
        mainView.userImageViewTapped = {
            print("userImage view tapped")
        }
    }
    
    private func loginButtonWasTapped() {
        mainView.loginTapped = {
            print("login was tapped")
        }
    }
    
    private func registerButtonWasTapped() {
        mainView.registerTapped = {
            print("register was tapped")
        }
    }
    
    private func listenToUserName() {
        mainView.userNameEditingChanged = { [weak self] in
            guard let self = self else {return}
            self.viewModel.updateUserName(self.mainView.userName ?? "")
//            print("name \(self.mainView.userName ?? "")")
        }
    }
}

