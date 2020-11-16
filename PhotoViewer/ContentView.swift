//
//  ContentView.swift
//  PhotoViewer
//
//  Created by Lei on 11/14/20.
//

import SwiftUI

let imgURL = "https://loremflickr.com/320/240?lock="

struct ContentView: View {
    @State private var layout = 1
    @State private var ids = (0 ... 3).map { $0 }

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: layout)) {
                    ForEach(ids, id: \.self) { id in
                        NavigationLink(
                            destination: ImageView(imgURL: "\(imgURL)\(id)"),
                            label: {
                                CardView(imgURL: "\(imgURL)\(id)")
                            }
                        )
                    }
                    .onDelete(perform: { _ in

                    })
                    .onMove(perform: move)
                }
                .padding(.all)
                .animation(.interactiveSpring())
            }
            .navigationTitle("PhotoViewer")

            .accentColor(.primary)
            .navigationBarItems(
                leading:
                Button(action: {
                    ids.append(ids.last! + 1)
                }) {
                    Text(Image(systemName: "plus"))
                },
                trailing:
                Button(action: {
                    layout = layout % 3 + 1
                }) {
                    Text(Image(systemName: "rectangle.grid.\(layout)x2"))
                }
            )
        }
    }

    func move(from source: IndexSet, to destination: Int) {
        ids.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
