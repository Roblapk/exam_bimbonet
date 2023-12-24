//
//  WebView.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 23/12/23.
//

import SwiftUI
import WebKit

struct WebView: View {
    
    var spaceship : SpaceshipModel
    
    var body: some View {
        VStack{
            DismissView()
                .padding(.top, 10)
            WVWrapper(urlWebLink: spaceship.links.article_link!)
        }
    }
}

struct WVWrapper: UIViewRepresentable {

    var urlWebLink : String
    
    func makeUIView(context: Context) -> WKWebView {
        let wkWebView = WKWebView()
        let request = URLRequest(url: URL(string: urlWebLink)!)
        wkWebView.load(request)
        return wkWebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
    
}

/*struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView()
    }
}*/
