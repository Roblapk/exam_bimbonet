//
//  LaunchUIView.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 20/12/23.
//

import SwiftUI

struct LaunchView: View {
    
    @State private var scale = CGSize(width: 0.8, height: 0.8)
    @State private var systemImgOpacity = 0.0
    @State private var systemImgTwoOpacity = 1.0
    
    @State private var opacity = 1.0
    
    @Binding var ispresented: Bool
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            //Color.gray.ignoresSafeArea()
            
            ZStack{
                Image(systemName: "paperplane")
                    .font(.system(size:110))
                    .foregroundStyle(.white)
                    .opacity(systemImgOpacity)
                
                Image(systemName: "paperplane.fill")
                    .font(.system(size: 110))
                    .foregroundColor(.white)
                    .opacity(systemImgTwoOpacity)
                    .offset(x:1)
            }
            .scaleEffect(scale)
        }
        .statusBar(hidden: true)
        .opacity(opacity)
        .onAppear{
            withAnimation(.easeInOut(duration: 2)){
                scale = CGSize(width: 1, height: 1)
                systemImgOpacity = 1
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
                withAnimation(.easeIn(duration: 0.35)){
                    scale = CGSize(width: 50, height: 50)
                    opacity = 0
                }
            })
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.9, execute: {
                withAnimation(.easeIn(duration: 0.3)){
                    ispresented.toggle()
                }
            })
        }
    }
}

/*struct LaunchUIView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchUIView()
    }
}*/
