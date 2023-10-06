//
//  ContentView.swift
//  AmiiboAPI
//
//  Created by Joel Lacerda on 06/10/23.
//

import SwiftUI

struct AmiiboList: View {
    @ObservedObject var remoteAmiiboLoader = RemoteAmiiboLoader()

    var body: some View {
        NavigationStack {
            List(remoteAmiiboLoader.amiibos, id: \.self) { amiibo in
                NavigationLink(destination: AmiiboDetails(amiibo: amiibo)) {
                    AmiiboRow(amiibo: amiibo)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .task {
            await remoteAmiiboLoader.fetchRemoteCharacters()
        }
    }
}
