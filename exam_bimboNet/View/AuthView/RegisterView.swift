//
//  RegisterView.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 21/12/23.
//

import SwiftUI

struct RegisterView: View {
    
    @ObservedObject var authViewModel: AuthViewModel
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
                Text("Registrate para poder ver la información")
                    .tint(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                TextField("Correo Electrónico", text: $textFEmail)
                SecureField("Contraseña", text: $textFPassword)
                Button("Registrarme"){
                    authViewModel.createNewUser(email: textFEmail,
                                                password: textFPassword)
                }
                .padding(.top, 20)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 10))
                .tint(.gray)
                if let errorMessage = authViewModel.errorMessage{
                    Text(errorMessage)
                        .bold()
                        .font(.body)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding(.top, 25)
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 50)
            Spacer()
        }
    }
}

/*struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}*/
