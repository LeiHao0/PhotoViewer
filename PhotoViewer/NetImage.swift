//
//  RemoteImage.swift
//  PhotoViewer
//
//  Created by Lei on 11/14/20.
//

import SwiftUI

var imagesStore = [String: Data]()

struct NetImage: View {
    private enum LoadState {
        case loading, success, failure
    }

    private class Loader: ObservableObject {
        var data = Data()
        var state = LoadState.loading

        init(url: String) {
            guard let parsedURL = URL(string: url) else {
                fatalError("Invalid URL: \(url)")
            }

            if let data = imagesStore[url], data.count > 0 {
                self.data = data
                state = .success
            } else {
                URLSession.shared.dataTask(with: parsedURL) { data, _, _ in
                    if let data = data, data.count > 0 {
                        self.data = data
                        self.state = .success
                        DispatchQueue.main.async {
                            imagesStore[url] = data
                        }
                    } else {
                        self.state = .failure
                    }

                    DispatchQueue.main.async {
                        self.objectWillChange.send()
                    }
                }.resume()
            }
        }
    }

    @StateObject private var loader: Loader
    var failure: Image

    var body: some View {
        if let image = UIImage(data: loader.data) {
            Image(uiImage: image).resizable()
        } else {
            switch loader.state {
            case .loading:
                VStack {
                    ProgressView()
                }.frame(height: 80.0)
            default:
                if let image = UIImage(data: loader.data) {
                    Image(uiImage: image).resizable()
                } else {
                    failure.resizable()
                }
            }
        }
    }

    init(url: String, failure: Image = Image(systemName: "multiply.circle")) {
        _loader = StateObject(wrappedValue: Loader(url: url))
        self.failure = failure
    }
}

struct NetImage_Previews: PreviewProvider {
    static var previews: some View {
        NetImage(url: imgURL + "0")
    }
}
