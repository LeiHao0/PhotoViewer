//
//  ImageView.swift
//  PhotoViewer
//
//  Created by Lei on 11/15/20.
//

import SwiftUI

struct ImageView: View {
    let imgURL: String
    
    var body: some View {
        Text(imgURL)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(imgURL: imgURL+"0")
    }
}
