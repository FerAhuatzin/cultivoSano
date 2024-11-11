//
//  PasswordConfirm.swift
//  Cultivo_sano
//
//  Created by iOS Lab on 08/10/24.
//

import SwiftUI

struct PasswordConfirm: View {
    @State private var empty: String = ""
    @State private var empty2: String = ""
    
    var body: some View {
        
        
            NavigationStack{
                VStack{
                    HStack {
                        Text("Nueva Contraseña")
                            .font(.title)
                            .bold()
                            .foregroundColor(Color("MainColor"))
                    }
                    .padding(.horizontal)
                    .padding(.bottom,50)
                    
                    
                    
                    
                    VStack {
                        SecureField("Ingresa la contraseña nueva", text: $empty)
                            
                            .padding(.top)
                        
                        Divider()
                            .background(Color.gray)
                            
                    }
                    .padding(.bottom,30)
                    
                    
                    VStack {
                        SecureField("Repetir Contraseña", text: $empty2)
                            
                            .padding(.top)
                        Divider()
                            .background(Color.gray)
                           
                    }
                    .padding(.bottom,50)
                    
                    
                    
                    Text("Confirmar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(Color("MainColor"))
                        .overlay(
                            Rectangle()
                                .stroke( (Color("MainColor")), lineWidth: 2)
                        )
                        
                    
                    
                    

                }
            }
            .padding(.horizontal,30)
    }
}

#Preview {
    PasswordConfirm()
}

