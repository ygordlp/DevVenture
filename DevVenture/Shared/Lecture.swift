//
//  Class.swift
//  DevVenture
//
//  Created by Ygor Duarte Lemos Pereira on 25/05/20.
//  Copyright © 2020 Ygor Duarte Lemos Pereira. All rights reserved.
//

import Foundation

struct Lecture: Decodable {
    let title: String
    let topics: String
    let date: String
    let summary: String
    let image: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case topics
        case date
        case summary
        case image
        case url
    }
}
