//
//  AmiiboRow.swift
//  AmiiboAPI
//
//  Created by Joel Lacerda on 06/10/23.
//

import SwiftUI

struct AmiiboRow: View {
    let amiibo: Amiibo
    @State var amiiboImage = Image("defaultImage")

    var body: some View {
        HStack {
            amiiboImage
                .resizable()
                .frame(width: 120, height: 180)
            Spacer()
            Text(amiibo.name)
                .bold()
            Spacer()
        }
        .task {
            self.amiiboImage = await UIImage.download(from: amiibo.image)
        }
    }
}

extension UIImage {
    static func download(from urlString: String) async -> Image {
        let url = URL(string: urlString)!
        let defaultImage = UIImage(named: "defaultImage")!

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            let uiImage = UIImage(data: data) ?? defaultImage

            return .init(uiImage: uiImage)
        } catch {
            print(error)
        }

        return Image(uiImage: defaultImage)
    }
}
