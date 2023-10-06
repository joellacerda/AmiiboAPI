//
//  AmiiboDetails.swift
//  AmiiboAPI
//
//  Created by Joel Lacerda on 06/10/23.
//

import SwiftUI

struct AmiiboDetails: View {
    let amiibo: Amiibo
    @State var amiiboImage = Image("defaultImage")

    var body: some View {
        VStack {
            amiiboImage
                .frame(width: 200, height: 300)
                .padding(.bottom, 60)
            Text("Name: \(amiibo.name)")
            Text("Game series: \(amiibo.gameSeries)")
            Text("Amiibo series: \(amiibo.amiiboSeries)")
        }
        .task {
            self.amiiboImage = await UIImage.download(from: amiibo.image)
        }
    }
}
