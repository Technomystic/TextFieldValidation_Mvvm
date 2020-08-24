//
//  YearPickerView.swift
//  TextFieldValidations_Mvvm
//
//  Created by Niraj on 24/08/2020.
//

import SwiftUI

struct YearPickerView: View {
    @Binding var birthYear: Int
    @Binding var showSelectorYear: Bool
    let currentYear = Calendar.current.dateComponents([.year], from: Date()).year!
    var body: some View {
        ZStack {
            Color(.black).opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 10) {
                            ForEach(((currentYear-100)...currentYear).reversed(), id:\.self) { year in
                                Button(action: {
                                    self.birthYear = year
                                    self.showSelectorYear.toggle()
                                }) {
                                    Text(String(year))
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                    }
                    .frame(height: 200)
                }
                .padding()
                .frame(width: 100)
                .background(Color(UIColor.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                Spacer()
            }
            .padding(.top)
            .animation(.easeIn)
        }

    }
}

struct YearPickerView_Previews: PreviewProvider {
    static var birthYear: Int = 0
    static var previews: some View {
        YearPickerView(birthYear: .constant(2020), showSelectorYear: .constant(false))
    }
}
