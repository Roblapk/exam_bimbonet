//
//  SliderView.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 23/12/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct SliderView: View {
    
    var spaceship : SpaceshipModel
    public let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var selection = 0
    
    var body: some View {
        VStack{
            DismissView()
                .padding(.top, 10)
            TabView(selection: $selection){
                ForEach(0..<spaceship.links.flickr_images!.count, id: \.self){ index in
                    WebImage(url: URL(string: spaceship.links.flickr_images![index]))
                        .resizable()
                        .indicator(.progress)
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .shadow(radius: 25)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .onReceive(timer, perform: { _ in
                withAnimation{
                    selection = selection < spaceship.links.flickr_images!.count ? selection + 1 : 0
                }
            })
        }
    }
}

/*struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}*/
