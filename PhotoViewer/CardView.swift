//
//  CardView.swift
//  PhotoViewer
//
//  Created by Lei on 11/15/20.
//

import SwiftUI

struct CardView: View {
    let imgURL: String
    
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        NetImage(url: imgURL)
            .aspectRatio(contentMode: .fit)
            .cornerRadius(12)
            .padding(10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(imgURL: imgURL+"0")
    }
}
