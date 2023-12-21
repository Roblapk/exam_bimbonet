//
//  LoginEmailView.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 21/12/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var textFEmail: String = ""
    @State var textFPassword: String = ""
    
    var body: some View {
        VStack{
            DismissView()
                .padding(.top, 10)
            Group{
                Text("Bienvenido a")
                Text("RBE-BIMBONET 🙋🏽‍♂️")
                    .bold()
            }
            .padding(.top, 10)
            .multilineTextAlignment(.center)
            .font(.largeTitle)
            .tint(.gray)
            Group{
                Text("Inicia Sesión para poder ver la información")
                    .tint(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                TextField("Correo Electrónico", text: $textFEmail)
                TextField("Contraseña", text: $textFPassword)
                Button("Iniciar Sesión"){
                    print("login")
                }
                .padding(.top, 20)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 10))
                .tint(.gray)
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 50)
            Spacer()
        }
    }
}

/*struct LoginEmailView_Previews: PreviewProvider {
    static var previews: some View {
        LoginEmailView()
    }
}*/
