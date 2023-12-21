//
//  DismissView.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 21/12/23.
//

import SwiftUI

struct DismissView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack{
            Spacer()
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.square.fill")
            }
            .tint(.gray)
            .padding(.trailing, 10)
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: 10))
    }
}

/*struct DismissView_Previews: PreviewProvider {
    static var previews: some View {
        DismissView()
    }
}*/
