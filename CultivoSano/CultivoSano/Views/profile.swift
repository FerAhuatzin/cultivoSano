//
//  profile.swift
//  Cultivo_sano
//
//  Created by iOS Lab on 02/10/24.
//



import SwiftUI

struct Profile: View {
    @State private var name: String = "Ricardo Martinez"
    @State private var phoneNumber: String = "981 118 4027"
    @State private var saved: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Tu Perfil")
                    .font(.system(size: 45, weight: .bold))
                    .foregroundColor(Color("MainColor"))
                    .fontWeight(.bold)
                
                VStack {
                    Text("Nombre")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("MainColor"))
                    TextField("Nombre", text: $name)
                        .padding(.top)
                    Divider()
                        .background(Color.gray)
                }
                .padding(.top,50)
                
                VStack {
                    Text("Número de teléfono")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("MainColor"))
                        .padding(.top,40)
                    TextField("Número de télefono", text: $phoneNumber)
                        .padding(.top)
                    Divider()
                        .background(Color.gray)
                }
                .padding(.bottom,50)
                
                Text("Guardar cambios")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(Color("MainColor"))
                    .overlay(
                        Rectangle()
                            .stroke( (Color("MainColor")), lineWidth: 2)
                    )
                    .onTapGesture {
                        withAnimation(.easeInOut(duration:0.5)){
                            saved.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                saved = false
                            }
                        }
                    }
                
                
                    .padding(.bottom,20)
                
                NavigationLink(destination: Login()) {
                    Text("Cerrar sesión")
                        .foregroundColor(Color("MainColor"))
                        .fontWeight(.bold)
                        .padding(.bottom,30)
                }
                Text("Se han guardado los cambios")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(saved ? .black.opacity(0.8): .white)
                    .clipShape(.buttonBorder)
            }
            
            .padding()
            
            
            
        }
        .padding(.horizontal,30)
    }
    
}

#Preview {
    Profile()
}

