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
            NetImageView(url: imgURL).aspectRatio(contentMode: isFit ? .fit : .fill)
                .onTapGesture(perform: {
                    isFit = !isFit
                })
                .animation(.easeInOut)
                .edgesIgnoringSafeArea(.all)
        }
        .navigationBarItems(
            trailing:
            Button(action: actionSheet, label: {
                Text(Image(systemName: "square.and.arrow.up"))
            })
        )
    }

    private func actionSheet() {
        if let data = imagesStore[imgURL], let image = UIImage(data: data) {
            let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(imgURL: imgURL + "0")
    }
}
