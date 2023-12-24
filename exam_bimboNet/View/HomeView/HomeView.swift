//
//  HomeView.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 21/12/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var authViewModel: AuthViewModel
    @StateObject var spaceshipViewModel = SpaceshipViewModel()
    @EnvironmentObject var network: Network
    @State private var showNetworkAlert = false
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Lanzamientos Pasados")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue),
                        footer:
                            Text("Sesión del usuario: \(authViewModel.emailUser?.email ?? "No hay usuario")")
                    .font(.subheadline)){
                        if !spaceshipViewModel.isLoading{
                            ForEach(spaceshipViewModel.spaceships, id: \.self) { spaceship in
                                NavigationLink(destination: DetailSpaceshipView(spaceship: spaceship), label: {
                                    SpaceCellView(spaceship: spaceship)
                                })
                            }
                        }else{
                            ProgressView("Cargando...")
                        }
                    }
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("NAVES ESPACIALES X 🚀")
            .toolbar {
                Button {
                    authViewModel.logoutUser()
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                }
            }
        }.task {
            spaceshipViewModel.getSpaceships()
        }.onChange(of: network.connected){ result in
            showNetworkAlert = result == false
        }.alert(network.connectionDescription, isPresented: $showNetworkAlert){}
    }
}

/*struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}*/
