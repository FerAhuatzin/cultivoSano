//
//  PasswordRecover.swift
//  Cultivo_sano
//
//  Created by iOS Lab on 04/10/24.
//

import SwiftUI

struct PasswordRecover: View {
    @State private var phoneNumber: String = "981 118 4027"
    var body: some View {
        NavigationStack{
            VStack{
                HStack {
                    Text("Recuperar contraseña")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("MainColor"))
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom,50)
                
                
                Text("Número de teléfono")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color("MainColor"))
                    .padding(.top,40)
                
                TextField("Número de Teléfono", text: $phoneNumber)
                Divider()
                    .background(Color.gray)
                    .padding(.bottom,50)
                    .keyboardType(.phonePad)
                
                
                
                NavigationLink(destination: EnterCode()) {
                    Text("Solicitar Código")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(Color("MainColor"))
                        .overlay(
                            Rectangle()
                                .stroke( (Color("MainColor")), lineWidth: 2)
                        )
                }
                
                    
                
                
                

            }
        }
        .padding(.horizontal,30)
        
    }
}

#Preview {
    PasswordRecover()
}

