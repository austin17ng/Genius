//
//  SearchResult.swift
//  Genius
//
//  Created by Nguyễn Tùng on 07/07/2022.
//

import Foundation

struct SearchResult: Decodable{
    var meta: Meta?
    var response: Response?
    
    struct Response: Decodable {
        var hits: [Hit]?
    }
}




