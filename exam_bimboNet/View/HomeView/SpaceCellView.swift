//
//  CellView.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 22/12/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct SpaceCellView: View {
    
    var spaceship : SpaceshipModel

    var body: some View {
        HStack{
            if spaceship.links.mission_patch_small != nil{
                WebImage(url: URL(string: spaceship.links.mission_patch_small!))
                    .resizable()
                    .placeholder{
                        Image("spaceship")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                    }
                    .indicator(.progress)
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 5)
            }else{
                Image("spaceship")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 5)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("\(spaceship.mission_name)")
                    .fontWeight(.semibold)
                    .font(.title2)
                    .minimumScaleFactor(0.5)
                Text("\(spaceship.flight_number)")
                    .font(.subheadline)
                Text("\(spaceship.launch_site.site_name)")
                    .font(.subheadline)
                Text("\( spaceship.launch_date_utc)")
                    .font(.subheadline)
                /*if spaceship.launch_date_utc != nil{
                    Text("\(NetworkImg.shared.changeDateFormat(dateUtc: spaceship.launch_date_utc))")
                }else{
                    
                }*/
            }
        }
    }
}

/*struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView()
    }
}*/
