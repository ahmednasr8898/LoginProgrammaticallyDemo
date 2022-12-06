//
//  LoginViewModelType.swift
//  LoginPageProgrammatically
//
//  Created by Semicolon on 06/12/2022.
//

import Foundation

typealias LoginViewModelType = LoginViewModelInput & LoginViewModelOutput

//MARK: - Actions
//
protocol LoginViewModelInput {
    func updateUserName(_ text: String)
    func updatePassword(_ text: String)
}

//MARK: - Update
//
protocol LoginViewModelOutput {
   
}
