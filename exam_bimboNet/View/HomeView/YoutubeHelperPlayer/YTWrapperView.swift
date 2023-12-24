//
//  YTWrapperView.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 23/12/23.
//

import SwiftUI
import YouTubeiOSPlayerHelper

struct YTWrapperView: View {
    
    var spaceship : SpaceshipModel
    
    var body: some View {
        VStack{
            DismissView()
                .padding(.top, 10)
            YTWrapper(videoID: spaceship.links.youtube_id)
        }
    }
}

struct YTWrapper: UIViewRepresentable {
    
    var videoID : String
    
    func makeUIView(context: Context) -> YTPlayerView {
        let playerView = YTPlayerView()
        playerView.load(withVideoId: videoID)
        playerView.playVideo()
        return playerView
    }
    
    func updateUIView(_ uiView: YTPlayerView, context: Context) {
    }
    
}

/*struct YTWrapperView_Previews: PreviewProvider {
    static var previews: some View {
        YTWrapperView()
    }
}*/
