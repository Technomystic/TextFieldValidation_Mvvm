//
//  ContentView.swift
//  TextFieldValidations_Mvvm
//
//  Created by Niraj on 24/08/2020.
//

import SwiftUI

struct ContentView: View {

    @State private var signVM = SignupViewModel()

    @State private var showYearSelector: Bool = false

    var body: some View {
        ZStack {
            VStack {
                VStack {
                    EntryTextView(sfImageName: "envelope", placeHolder: "Enter username", field: $signVM.username , isSecure: false, prompt: "")

                    EntryTextView(sfImageName: "lock", placeHolder: "Enter password", field: $signVM.password, isSecure: true, prompt: "")
                    EntryTextView(sfImageName: "lock", placeHolder: "Confirm password", field: $signVM.confirmPass, isSecure: true, prompt: "")

                    VStack(spacing: 5) {
                        Button(action: {
                            // Present Selection
                            self.showYearSelector.toggle()
                        }) {
                            Text(String(signVM.birthYear))
                                .padding(8)
                                .foregroundColor(.primary)
                                .background(Color(UIColor.secondarySystemBackground))
                                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                        }
                        Text("Year of birth").font(.caption)
                    }
                    .padding(.vertical,8)

                    Button(action: {
                        // Create the user
                    }) {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                            .background(Capsule().fill(Color.blue))
                    }
                }
                .padding()
                .background(Color(UIColor.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                Spacer()
            }.disabled(showYearSelector)
            .padding()

            YearPickerView(birthYear: $signVM.birthYear, showSelectorYear: $showYearSelector)
                .opacity(showYearSelector ? 1 : 0)
                .animation(.easeIn)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct EntryTextView: View {
    var sfImageName = ""
    var placeHolder: String = ""
    @Binding var field: String
    var isSecure: Bool = false
    var prompt: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: sfImageName)
                    .frame(width: 44, height: 44)
                if isSecure {
                    SecureField(placeHolder, text: $field).autocapitalization(.none)
                } else {
                    TextField(placeHolder, text: $field).autocapitalization(.none)
                }
            }
            .padding(8)
            .background(Color(UIColor.secondarySystemBackground))
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))

            Text(prompt)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .font(.caption)
        }
    }
}
