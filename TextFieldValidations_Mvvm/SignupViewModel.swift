//
//  SignupViewModel.swift
//  TextFieldValidations_Mvvm
//
//  Created by Niraj on 24/08/2020.
//

import Foundation

class SignupViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var confirmPass = ""
    var birthYear: Int = Calendar.current.dateComponents([.year], from: Date()).year!

    //MARK: Validations

    func passwordMatch() -> Bool {
        password == confirmPass
    }

    func isValidPassword() -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$")
        return passwordTest.evaluate(with: password)
    }

    func isValidEmail() -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: username)
    }

    func isValidAge() -> Bool {
        (Calendar.current.dateComponents([.year], from: Date()).year! - birthYear) >= 21
    }

    var isSignUpCompleted: Bool {
        if !isValidPassword() || !isValidEmail() || !isValidAge() || !passwordMatch() {
            return false
        } else {
            return true
        }
    }

    //MARK: Validation String

    var confirmPwPrompt: String {
        if passwordMatch() {
            return ""
        } else {
            return "Password dont match"
        }
    }

    var validEmil: String {
        if isValidEmail() {
            return ""
        } else {
            return "Email not valid"
        }
    }

    var validPassword: String {
        if isValidPassword() {
            return ""
        } else {
            return "Password not valid"
        }
    }

    var validAge: String {
        if isValidAge() {
            return ""
        } else {
            return "Invalid Age"
        }
    }

    func signUp() {
        username = ""
        password = ""
        confirmPass = ""
        birthYear = Calendar.current.dateComponents([.year], from: Date()).year!
    }
}
