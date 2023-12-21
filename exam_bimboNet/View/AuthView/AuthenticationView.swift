//
//  ContentView.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 20/12/23.
//

import SwiftUI

struct AuthenticationView: View {
    
    @ObservedObject var authViewModel: AuthViewModel
    @State private var authenticationSheetView: AuthenticationSheetView?
    
    var body: some View {
        VStack {
            Image("spaceship")
                .resizable()
                .frame(width: 250, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .overlay(RoundedRectangle(cornerRadius: 30).stroke(lineWidth: 1).foregroundColor(.gray))
                .shadow(radius: 20)
            VStack{
                Button {
                    authenticationSheetView = .login
                } label: {
                    Label("Inicia sesión con Email", systemImage: "envelope.fill")
                }.tint(.gray)
            }
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 10))
            .padding(.top, 50)
            Spacer()
            HStack{
                Button {
                    authenticationSheetView = .register
                } label: {
                    Text("¿Aún no tienes cuenta?")
                    Text("Regístrate aquí").underline()
                        .foregroundColor(.blue)
                }.foregroundColor(.gray)
            }.padding(.bottom, 15)
        }
        .shadow(radius: 20)
        .padding(.top, 50)
        .sheet(item: $authenticationSheetView) { whichSheet in
            switch whichSheet{
                case .login: LoginView(authViewModel: authViewModel)
            case .register: RegisterView(authViewModel: authViewModel)
            }
        }
    }
}

enum AuthenticationSheetView: String, Identifiable{
    case register
    case login
    
    var id: String{
        return rawValue
    }
}

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}*/
