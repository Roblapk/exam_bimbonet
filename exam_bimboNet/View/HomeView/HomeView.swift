//
//  HomeView.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 21/12/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Bienvenido \(authViewModel.emailUser?.email ?? "No hay usuario")")
                    .padding(.top, 35)
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("HOME")
            .toolbar {
                Button("Logout"){
                    authViewModel.logoutUser()
                }
            }
        }
    }
}

/*struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}*/
