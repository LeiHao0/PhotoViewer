//
//  ContentView.swift
//  PhotoViewer
//
//  Created by Lei on 11/14/20.
//

import SwiftUI

let imgURL = "https://loremflickr.com/320/240?lock="

struct ContentView: View {
    
    
    let ids = (0...50)
    let columnns = [
        GridItem(.adaptive(minimum: 240))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columnns) {
                    ForEach(ids, id: \.self) { id in
                        NavigationLink(
                            destination: ImageView(imgURL: "\(imgURL)\(id)"),
                            label: {
                                CardView(imgURL: "\(imgURL)\(id)")
                            })
                    }
                    
                }
                .padding(.horizontal)
            }
            .navigationTitle("PhotoViewer")
            .accentColor(.primary)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
