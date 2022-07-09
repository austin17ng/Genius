//
//  Section.swift
//  Genius
//
//  Created by Nguyễn Tùng on 07/07/2022.
//

import Foundation

struct Section: Decodable {
    var type: String?
    var hits: [Hit]?
}
