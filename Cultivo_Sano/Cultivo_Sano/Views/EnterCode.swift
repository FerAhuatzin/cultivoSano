//
//  PasswordRecover.swift
//  Cultivo_sano
//
//  Created by iOS Lab on 04/10/24.
//

import SwiftUI

struct EnterCode: View {
    @State private var phoneNumber: String = "981 118 4027"
    
    @State private var vacio: String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack {
                    Text("Ingresar Código")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("MainColor"))
  
                }
                .padding(.horizontal)
                .padding(.bottom,50)
                
                Text("Hemos enviado un mensaje SMS con el código solicitado a tu teléfono \(phoneNumber)")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .padding(.bottom, 40)
                
                
                
                
                TextField("Escribe el código aquí", text: $vacio)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    .padding(.bottom,50)
                   
                
                
                NavigationLink(destination: PasswordConfirm()) {
                    Text("Confirmar Código")
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
    EnterCode()
}

