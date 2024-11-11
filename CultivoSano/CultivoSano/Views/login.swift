//
//  login.swift
//  Cultivo_sano
//
//  Created by iOS Lab on 02/10/24.
//

import SwiftUI

struct Login: View {
    @State private var cellphone: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                //esta imagen se cambiaría por el logo
                Image(systemName: "leaf.arrow.circlepath")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color("MainColor"))
                    .padding(.bottom, 5)
                    .padding(.top,50)
                Text("Cultivo sano")
                    .font(.title)
                    .padding(.bottom,2)
                Text("Analiza, cuida y mejora tus cultivos ")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .padding(.bottom, 40)
                
                VStack {
                    TextField("Número de teléfono", text: $cellphone)
                        .padding(.horizontal,30)
                        .padding(.top)
                        .keyboardType(.phonePad)
                    Divider()
                        .background(Color.gray)
                        .padding(.horizontal,30)
                }
                .padding(.bottom,30)
                
                
                VStack {
                    SecureField("Contraseña", text: $password)
                        .padding(.horizontal,30)
                        .padding(.top)
                    Divider()
                        .background(Color.gray)
                        .padding(.horizontal,30)
                }
                .padding(.bottom,30)
                
                HStack(spacing: 0) {
                    NavigationLink(destination: ContentView()) {
                        Text("Continuar")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(Color("MainColor"))
                            .overlay(
                                Rectangle()
                                    .stroke( (Color("MainColor")), lineWidth: 2)
                            )
                    }
                    
                    NavigationLink(destination: Register()) {
                        Text("Crear cuenta")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(Color("MainColor"))
                            .overlay(
                                Rectangle()
                                    .stroke( (Color("MainColor")), lineWidth: 2)
                            )
                    }
                }
                .padding(.bottom, 30)
                .padding(.horizontal, 30)
                HStack{
                    Text("¿Olvidaste tu contraseña?")
                    NavigationLink(destination: PasswordRecover()) {
                        Text("Recupérala")
                            .foregroundColor(Color("MainColor"))
                            .fontWeight(.bold)
                    }
                }
            }
            .padding()
            .padding(.bottom,70)
            .background(Color(UIColor.systemBackground).ignoresSafeArea())
        }
    }
}

#Preview {
    Login()
}

