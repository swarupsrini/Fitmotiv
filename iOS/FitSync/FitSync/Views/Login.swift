//
//  Login.swift
//  FitSync
//
//  Created by Sai Gurrapu on 1/16/21.
//

import SwiftUI

struct Login: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack{
            HStack {
                VStack(alignment: .leading) {
                    Text("Login")
                        .bold()
                        .font(.title)

                    //Email
                    HStack {
                        Image(systemName: "person").foregroundColor(.black).font(.system(size: 20, weight: .semibold, design: .default))
                        TextField("Email", text: $email).font(.system(size: 20, weight: .semibold, design: .default))

                    }
                    .padding(.bottom, 20)
                    .overlay(
                        Rectangle()
                            .frame(height: 4)
                            .foregroundColor(Color.black),
                        alignment: .bottom
                    )
                    .padding(.bottom, 30)

                    //Password
                    HStack {
                        Image(systemName: "key").foregroundColor(.black).font(.system(size: 20, weight: .semibold, design: .default))
                        SecureField("Password", text: $password).font(.system(size: 20, weight: .semibold, design: .default))

                    }
                    .padding(.bottom, 20)
                    .overlay(
                        Rectangle()
                            .frame(height: 4)
                            .foregroundColor(Color.black),
                        alignment: .bottom
                    ).padding(.bottom, 50)


                    //Button
                    Button(action: {

                    }) {
                        HStack(alignment: .center) {
                            Spacer()
                            Text("Login").foregroundColor(Color.white).bold()
                            Spacer()
                        }

                    }.padding().background(Color.black).cornerRadius(20.0).padding(.bottom, 20)

                    Button(action: {

                    }) {
                        HStack(alignment: .center) {
                            Spacer()
                            Text("Login with Facebook").foregroundColor(Color.white).bold()
                            Spacer()
                        }

                    }.padding().background(Color.blue).cornerRadius(20.0)


                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.leading, 30)
            .padding(.trailing, 30)
            .padding(20)
            .background(Color.white)
            .cornerRadius(25)

            VStack(alignment: .center){
                Text("Forgot Password?").bold()
                    .padding(.bottom, 20)
                Text("Create a New Account").bold()
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
