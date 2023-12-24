//
//  HomeView.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 21/12/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var authViewModel: AuthViewModel
    @ObservedObject var spaceshipViewModel = SpaceshipViewModel()
    
    var body: some View {
        NavigationView{
            List{
                Section(header:
                            Text("Lanzamientos Pasados")
                                .font(.title2)
                                .fontWeight(.semibold),
                        footer:
                            Text("Sesión del usuario: \(authViewModel.emailUser?.email ?? "No hay usuario")")
                                .font(.subheadline)){
                                    ForEach(spaceshipViewModel.spaceships, id: \.self) { spaceship in
                                        NavigationLink(destination: DetailSpaceshipView(spaceship: spaceship), label: {
                                                SpaceCellView(spaceship: spaceship)
                                        })
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
        }.onAppear{
            spaceshipViewModel.getSpaceships()
        }
    }
}

/*struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}*/
