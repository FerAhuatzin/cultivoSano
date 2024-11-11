//
//  ContentView.swift
//  Cultivo_sano
//
//  Created by iOS Lab on 02/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            
            
            Main()
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }
            
            /*MisCultivosView()
                .tabItem {
                    Image(systemName: "leaf")
                    Text("Inicio")
                }*/
            
            Profile()
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }
            
        }
        .navigationBarBackButtonHidden(true)
        .tint(Color("MainColor"))
    }
    
}

#Preview {
    ContentView()
}
