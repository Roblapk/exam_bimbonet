//
//  DetailView.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 22/12/23.
//

import SwiftUI
import YouTubeiOSPlayerHelper
import SDWebImageSwiftUI

struct DetailSpaceshipView: View {
    
    var spaceship : SpaceshipModel
    @State private var detailOptionsSheetView: DetailOptionsSheetView?
    
    var body: some View {
        
        VStack{
            
            VStack{
                WebImage(url: URL(string: spaceship.links.mission_patch_small!))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .shadow(radius: 20)
            }.padding()
            
            Spacer()
                .frame(height: 20)
            
            VStack(alignment: .center, spacing: 10){
                Text("Detalles de la Nave Espacial")
                    .fontWeight(.semibold)
            }
            .padding(.horizontal, 10)
            
            Spacer()
                .frame(height:25)
            
            VStack(alignment: .leading, spacing: 10){
                
                Text("Fecha de Lanzamiento: \(Globals.shared.changeDateFormat(dateUtc: spaceship.launch_date_utc))")
                    .font(.subheadline)
                    .padding(.top, 3)
                
                Text("Sitio de Lanzamiento: \(spaceship.launch_site.site_name_long)")
                    .font(.subheadline)
                
                Text("Nombre de la nave: \(spaceship.rocket.rocket_name)")
                    .font(.subheadline)
                
                Text("Tipo de nave: \(spaceship.rocket.rocket_type)")
                    .font(.subheadline)
                
                Text("Detalles: \(spaceship.details ?? "No Details")")
                    .font(.subheadline)
                    .padding(.bottom, 3)
            }
            .padding(.horizontal, 12)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .background(LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .top, endPoint: .bottom))
            .shadow(radius: 25)
            
            Spacer()
                .frame(height:25)
            
            VStack(alignment: .center, spacing: 10){
                
                if spaceship.links.flickr_images!.count > 0 {
                    Group{
                        Button {
                            detailOptionsSheetView = .slider
                        } label: {
                            Label("Ver las imagenes en el slider", systemImage: "photo.fill")
                        }.tint(.gray)
                    }
                    .controlSize(.large)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle(radius: 10))
                }
                
                if spaceship.links.article_link != nil {
                    Group{
                        Button {
                            detailOptionsSheetView = .web
                        } label: {
                            Label("Ver información del artículo", systemImage: "info.circle.fill")
                        }.tint(.blue)
                    }
                    .controlSize(.large)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle(radius: 10))
                }
                
                if spaceship.links.youtube_id != "" {
                    Group{
                        Button {
                            detailOptionsSheetView = .youtube
                        } label: {
                            Label("Ver el video en Youtube", systemImage: "play.rectangle.fill")
                        }.tint(.red)
                    }
                    .controlSize(.large)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle(radius: 10))
                }
                
            }
            .padding(.horizontal, 10)
            /*.background(LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .top, endPoint: .bottom))*/
            .shadow(radius: 25)
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("\(spaceship.mission_name) 🚀")
        .sheet(item: $detailOptionsSheetView) { whichSheet in
            switch whichSheet{
                case .slider: SliderView(spaceship: spaceship)
                case .youtube: YTWrapperView(spaceship: spaceship)
                case .web: WebView(spaceship: spaceship)
            }
        }
    }
}

enum DetailOptionsSheetView: String, Identifiable{
    case slider
    case youtube
    case web
    
    var id: String{
        return rawValue
    }
}

/*struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}*/
