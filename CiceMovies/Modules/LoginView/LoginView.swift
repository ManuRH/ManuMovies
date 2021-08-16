//
//  LoginView.swift
//  CiceMovies
//
//  Created by CICE on 15/06/2021.
//

import SwiftUI

let lightGreyColor = Color(red: 239/255, green: 243/255, blue: 243/255)

struct LoginView: View {
    
    @ObservedObject var loginPresenter = LoginPresenter()
    
    var body: some View {
        VStack{
            Form{
                Section(header: Text("Informacion Personal")){
                    VStack(alignment: .leading) {
                        UsernameTextField(placeholder: "Name", title: "Name", text: self.$loginPresenter.name)
                            .autocapitalization(.none)
                            .padding(5)
                            .background(lightGreyColor)
                            .cornerRadius(5)
                            .shadow(radius: 1)
                        if !loginPresenter.nameMessage.isEmpty {
                            Text(loginPresenter.nameMessage)
                                .font(.caption)
                                .foregroundColor(.red)
                        }
                        
                        UsernameTextField(placeholder: "Last Name", title: "Last Name", text: self.$loginPresenter.lastname)
                            .autocapitalization(.none)
                            .padding(5)
                            .background(lightGreyColor)
                            .cornerRadius(5)
                            .shadow(radius: 1)
                        if !loginPresenter.lastnameMessage.isEmpty {
                            Text(loginPresenter.lastnameMessage)
                                .font(.caption)
                                .foregroundColor(.red)
                        }
                        
                        UsernameTextField(placeholder: "Email", title: "Email", text: self.$loginPresenter.email)
                            .autocapitalization(.none)
                            .padding(5)
                            .background(lightGreyColor)
                            .cornerRadius(5)
                            .shadow(radius: 1)
                        if !loginPresenter.emailMessage.isEmpty {
                            Text(loginPresenter.emailMessage)
                                .font(.caption)
                                .foregroundColor(.red)
                        }
                        
                        UsernameTextField(placeholder: "User Name", title: "User Name", text: self.$loginPresenter.username)
                            .autocapitalization(.none)
                            .padding(5)
                            .background(lightGreyColor)
                            .cornerRadius(5)
                            .shadow(radius: 1)
                        if !loginPresenter.usernamedMessage.isEmpty {
                            Text(loginPresenter.usernamedMessage)
                                .font(.caption)
                                .foregroundColor(.red)
                        }
                    }
                }
                Section(header: Text("Información segura")){
                    VStack(alignment: .leading) {
                        PasswordTextField(title: "Password", text: self.$loginPresenter.password)
                            .autocapitalization(.none)
                            .padding(5)
                            .background(lightGreyColor)
                            .cornerRadius(5)
                            .shadow(radius: 1)
                        
                        PasswordTextField(title: "Password confirmation", text: self.$loginPresenter.passwordAgain)
                            .autocapitalization(.none)
                            .padding(5)
                            .background(lightGreyColor)
                            .cornerRadius(5)
                            .shadow(radius: 1)
                    }
                }
            }
            Button(action: {
                //
            }, label: {
                Text("Login ")
            }).disabled(!self.loginPresenter.isvalid)
            
        }

    }
}

struct UsernameTextField: View{
    
    var placeholder: String
    var title: String
    var text: Binding<String>
    
    var body: some View{
        ZStack(alignment: .leading) {
            Text(title).foregroundColor(.gray).offset(y: text.wrappedValue.isEmpty ? 0 : -25).scaleEffect(text.wrappedValue.isEmpty ? 1 : 0.6, anchor: .leading)
            TextField(placeholder, text: text).foregroundColor(.black)
        }
        .padding(.top, 15)
        .animation(.spring(response: 0.2, dampingFraction: 0.5))
    }
}

struct PasswordTextField: View {
    
    var title: String
    var text: Binding<String>
    
    var body: some View{
        ZStack(alignment: .leading) {
            Text(title).foregroundColor(.gray).offset(y: text.wrappedValue.isEmpty ? 0 : -25).scaleEffect(text.wrappedValue.isEmpty ? 1 : 0.6, anchor: .leading)
            SecureField("", text: text).foregroundColor(.black)
        }
        .padding(.top, 15)
        .animation(.spring(response: 0.2, dampingFraction: 0.5))
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
