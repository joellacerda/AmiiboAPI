//
//  RemoteAmiiboLoader.swift
//  AmiiboAPI
//
//  Created by Joel Lacerda on 06/10/23.
//

import Foundation

final class RemoteAmiiboLoader: ObservableObject {
    @Published var amiibos: [Amiibo] = []
    
    @MainActor
    func fetchRemoteCharacters() async {
        let session = URLSession.shared
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        do {
            let (data, _) = try await session.data(
                for: URLRequest(
                    url: URL(string: "https://www.amiiboapi.com/api/amiibo")!
                )
            )

            guard let remoteAmiibos = try? decoder.decode(RemoteAmiibos.self, from: data) else {
                fatalError("Erro de decode")
            }
            print(String(data: data, encoding: .utf8)!)
            
            self.amiibos = remoteAmiibos.amiibo
        } catch {
            print(error)
        }

    }
}
