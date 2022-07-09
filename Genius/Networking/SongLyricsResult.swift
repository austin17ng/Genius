//
//  SongLyricsResult.swift
//  Genius
//
//  Created by Nguyễn Tùng on 08/07/2022.
//

import Foundation

struct SongLyricsResult: Decodable {
    var meta: Meta?
    var response: Response?
    
    struct Response: Decodable {
        var lyrics: Lyrics?
        struct Lyrics: Decodable {
            var _type: String?
            var api_path: String?
            var lyrics: Lyrics?
            struct Lyrics: Decodable {
                var body: Body?
            }
        }
    }

    
}

