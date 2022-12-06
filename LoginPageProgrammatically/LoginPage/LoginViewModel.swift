//
//  LoginViewModel.swift
//  LoginPageProgrammatically
//
//  Created by Semicolon on 06/12/2022.
//

import Foundation

class LoginViewModel {
    private var userName: String = ""
    private var password: String = ""
}

//MARK: - LoginViewModel Input
//
extension LoginViewModel: LoginViewModelInput {
    func updateUserName(_ text: String) {
        userName = text
    }
    
    func updatePassword(_ text: String) {
        password = text
    }
}

extension LoginViewModel: LoginViewModelOutput {
    
}
