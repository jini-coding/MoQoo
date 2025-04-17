//
//  LoginView.swift
//  MoQoo
//
//  Created by Jini on 4/18/25.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        if !isLoggedIn {
            TabBarView()
        }
        else {
            loginview
        }
    }
    
    var loginview: some View {
        ZStack {
            Color(hex: "#FFFDF8").ignoresSafeArea()
            
//            Circle()
//                .fill(Color.mqMain)
//                .offset(x: 200, y: -340)
            
            VStack {
                Spacer().frame(height: 200)
                
                TextField("Email", text: $email)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(Color.mqGraybg)
                    .cornerRadius(8)
                    .padding(.horizontal, 16)
                
                SecureField("Password", text: $password)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(Color.mqGraybg)
                    .cornerRadius(8)
                    .padding(.horizontal, 16)
                
                
                Button {
                    login()
                } label: {
                    Text("로그인")
                        .font(.mq(.bold, size: 18))
                        .frame(width: 200, height: 40)
                        .foregroundColor(.white)
                        .background(Color.mqMain)
                        .cornerRadius(12)
                }
                
                Spacer().frame(height: 100)
                
                Button {
                    register()
                } label: {
                    Text("회원가입")
                        .font(.mq(.bold, size: 18))
                        .frame(width: 200, height: 40)
                        .foregroundColor(.white)
                        .background(Color.mqMain)
                        .cornerRadius(12)
                }
                
                Spacer()
            }
            .onAppear {
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        isLoggedIn.toggle()
                    }
                }
            }
        }
    }
    
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

#Preview {
    LoginView()
}
