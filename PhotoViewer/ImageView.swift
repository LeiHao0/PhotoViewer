//
//  ImageView.swift
//  PhotoViewer
//
//  Created by Lei on 11/15/20.
//

import SwiftUI

struct ImageView: View {
    let imgURL: String
    
    @State private var isFit = true
    
    var body: some View {
        VStack {
            
            Spacer(minLength: 0)
            NetImage(url: imgURL).aspectRatio(contentMode: isFit ? .fit : .fill)
                .onTapGesture(perform: {
                    isFit = !isFit
                })
                .animation(.easeInOut)
                .edgesIgnoringSafeArea(.all)
            Spacer(minLength: 0)
        }
            
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(imgURL: imgURL+"0")
    }
}
