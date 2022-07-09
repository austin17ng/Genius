//
//  CommentResult.swift
//  Genius
//
//  Created by Nguyễn Tùng on 08/07/2022.
//

import Foundation

struct CommentResult: Decodable {
    var meta: Meta?
    var response: Response?
    
    struct Response: Decodable {
        var total_count: Int?
        var next_page: Int?
        var comments: [Comment]?
    }
}
