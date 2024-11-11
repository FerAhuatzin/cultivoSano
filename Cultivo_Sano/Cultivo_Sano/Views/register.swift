//
//  register.swift
//  Cultivo_sano
//
//  Created by iOS Lab on 02/10/24.
//

import SwiftUI

struct Register: View {
    @State private var first_name: String = ""
    @State private var last_names: String = ""
    @State private var cellphone: String = ""
    @State private var password: String = ""
    @State private var password_confirmation: String = ""
    @State private var accepted_terms_and_conditions:Bool = false
    var body: some View {
        NavigationStack
        {
            VStack{
                
                HStack {
                    Text("Comienza a hacer tus cultivos más sanos")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("MainColor"))
                    Spacer()
                }
                .padding(.horizontal,30)
                VStack {
                    TextField("Nombre", text: $first_name)
                        .padding(.horizontal,30)
                        .padding(.top)
                        .keyboardType(.phonePad)
                    Divider()
                        .background(Color.gray)
                        .padding(.horizontal,30)
                }
                .padding(.bottom,10)
                VStack {
                    TextField("Apellidos", text: $last_names)
                        .padding(.horizontal,30)
                        .padding(.top)
                        .keyboardType(.phonePad)
                    Divider()
                        .background(Color.gray)
                        .padding(.horizontal,30)
                }
                .padding(.bottom,10)
                VStack {
                    TextField("Número de teléfono", text: $cellphone)
                        .padding(.horizontal,30)
                        .padding(.top)
                        .keyboardType(.phonePad)
                    Divider()
                        .background(Color.gray)
                        .padding(.horizontal,30)
                }
                .padding(.bottom,10)
                VStack {
                    SecureField("Contraseña", text: $password)
                        .padding(.horizontal,30)
                        .padding(.top)
                        .keyboardType(.phonePad)
                    Divider()
                        .background(Color.gray)
                        .padding(.horizontal,30)
                }
                .padding(.bottom,10)
                VStack {
                    SecureField("Confirmar contraseña", text: $password_confirmation)
                        .padding(.horizontal,30)
                        .padding(.top)
                        .keyboardType(.phonePad)
                    Divider()
                        .background(Color.gray)
                        .padding(.horizontal,30)
                }
                .padding(.bottom,30)
                
                
                HStack {
                    Button(action: {
                        accepted_terms_and_conditions.toggle()
                    }){
                        Image(systemName: accepted_terms_and_conditions ? "checkmark.square" : "square")
                            .foregroundColor(accepted_terms_and_conditions ? Color("MainColor") : .gray)
                    }
                    Text("Aceptar")
                    NavigationLink(destination: fake()) {
                        Text("Términos y condiciones")
                            .foregroundColor(Color("MainColor"))
                            .fontWeight(.bold)
                    }
                    Spacer()
                    
                }
                .fontWeight(.light)
                .padding(.horizontal,30)
                .padding(.bottom,30)
                .foregroundStyle(.black)
                
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
                .padding(.horizontal,30)
                .padding(.bottom,70)
                
            }
        }
    }
}


#Preview {
    Register()
}
