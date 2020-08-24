//
//  SignupViewModel.swift
//  TextFieldValidations_Mvvm
//
//  Created by Niraj on 24/08/2020.
//

import Foundation

class SignupViewModel {
    var username = ""
    var password = ""
    var confirmPass = ""
    var birthYear: Int = Calendar.current.dateComponents([.year], from: Date()).year!
}
