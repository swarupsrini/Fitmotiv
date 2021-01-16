//
//  Login.swift
//  FitSync
//
//  Created by Sai Gurrapu on 1/16/21.
//

import SwiftUI

struct Login: View {
    @State private var firstName = ""

    var body: some View {
        VStack{
            HStack {
                VStack(alignment: .leading) {
                    Text("Login")
                        .bold()
                        .font(.title)

                    HStack {
                        Image(systemName: "person").foregroundColor(.black).font(.system(size: 20, weight: .semibold, design: .default))
                        TextField("Email", text: $firstName).font(.system(size: 20, weight: .semibold, design: .default))

                    }
                    .padding(.bottom, 20)
                    .overlay(
                        Rectangle()
                            .frame(height: 4)
                            .foregroundColor(Color.black),
                        alignment: .bottom
                    )
                    .padding(.bottom, 30)

                    HStack {
                        Image(systemName: "person").foregroundColor(.black).font(.system(size: 20, weight: .semibold, design: .default))
                        SecureField("Password", text: $firstName).font(.system(size: 20, weight: .semibold, design: .default))

                    }
                    .padding(.bottom, 20)
                    .overlay(
                        Rectangle()
                            .frame(height: 4)
                            .foregroundColor(Color.black),
                        alignment: .bottom
                    )

                    //                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))

                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.leading, 30)
            .padding(.trailing, 30)
            .padding(20)
            .background(Color.white)
            .cornerRadius(25)
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
