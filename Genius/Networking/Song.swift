//
//  Song.swift
//  Genius
//
//  Created by Nguyễn Tùng on 07/07/2022.
//

import Foundation

struct Song: Decodable {
    var _type: String?
    var title: String?
    var artist_names: String?
    var custom_header_image_url : String?
    var description_preview: String?
    var full_title: String?
    var spotify_uuid: String?
    var youtube_url: String?
}

struct Stats {
    var pageviews: String?
}
