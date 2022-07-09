//
//  File.swift
//  Genius
//
//  Created by Nguyễn Tùng on 08/07/2022.
//

import Foundation

struct Comment: Decodable {
    var _type: String?
    var body: Body?
    var created_at: Int?
    var votes_total: Int?
    var author: Author?
}
