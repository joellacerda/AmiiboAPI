//
//  RemoteAmiibo.swift
//  AmiiboAPI
//
//  Created by Joel Lacerda on 06/10/23.
//

import Foundation

struct RemoteAmiibos: Decodable {
    let amiibo: [Amiibo]
}

struct Amiibo: Decodable, Hashable {
    let name: String
    let image: String
    let gameSeries: String
    let amiiboSeries: String
}

