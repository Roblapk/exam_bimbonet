//
//  ContainerView.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 20/12/23.
//

import SwiftUI
  
struct ContainerView: View {
    
    @State private var isLaunchViewPresented = true
    
    var body: some View {
        if !isLaunchViewPresented{
            AuthenticationView()
        }else{
            LaunchView(ispresented: $isLaunchViewPresented)
        }
    }
}

/*struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}*/
