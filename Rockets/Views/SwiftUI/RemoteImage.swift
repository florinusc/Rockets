//
//  RemoteImage.swift
//  Rockets
//
//  Created by Florin Uscatu on 21.02.2021.
//

import SwiftUI

struct RemoteImage: View {
    
    @StateObject private var loader: ImageLoader

    var body: some View {
        selectImage()?
            .resizable()
    }

    init(url: String) throws {
        let imageLoader = try ImageLoader(url: url)
        _loader = StateObject(wrappedValue: imageLoader)
    }

    private func selectImage() -> Image? {
        guard let data = loader.data, let image = UIImage(data: data) else { return nil }
        return Image(uiImage: image)
    }
    
}
