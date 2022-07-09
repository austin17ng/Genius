//
//  Api.swift
//  Genius
//
//  Created by Nguyễn Tùng on 07/07/2022.
//

import Foundation
import Alamofire

class Api {
    static let shared = Api()
    let baseUrl = "https://genius-song-lyrics1.p.rapidapi.com/"
    let headers: HTTPHeaders = [
        "X-RapidAPI-Key": "793bc3a1b4msh58042c4d9095b99p1c1c61jsna76f35db10b4",
        "X-RapidAPI-Host": "genius-song-lyrics1.p.rapidapi.com"
    ]
    
    func search(term: String) async throws -> SearchResult {
        return try await AF.request(
            baseUrl + "search",
            method: .get,
            parameters: ["q": term],
            headers: headers,
            interceptor: nil,
            requestModifier: nil)
        .serializingDecodable(SearchResult.self)
        .value
    }
    
    func multiSearch(term: String) async throws -> MultiSearchResult {
        return try await AF.request(
            baseUrl + "search/multi",
            method: .get,
            parameters: ["q": term],
            headers: headers,
            interceptor: nil,
            requestModifier: nil)
        .serializingDecodable(MultiSearchResult.self)
        .value
    }
    
    func fetchSong(id: String, completion: @escaping (_ sucess: Bool, _ result: SongResult?) -> Void) {
        AF.request(
            baseUrl + "songs/\(id)",
            method: .get,
            headers: headers,
            interceptor: nil,
            requestModifier: nil)
        .responseDecodable(of: SongResult.self) { data in
            completion(true, data.value)
        }
    }
    
    func fetchLyrics(id: String, completion: @escaping (_ sucess: Bool, _ result: SongLyricsResult?) -> Void) {
        AF.request(
            baseUrl + "songs/\(id)/lyrics",
            method: .get,
            headers: headers,
            interceptor: nil,
            requestModifier: nil)
        .responseDecodable(of: SongLyricsResult.self) { data in
            completion(true, data.value)
        }
    }
    
    func fetchComments(id: String, completion: @escaping (_ sucess: Bool, _ result: CommentResult?) -> Void) {
        AF.request(
            baseUrl + "songs/\(id)/comments",
            method: .get,
            parameters: ["text_format": "plain"],
            headers: headers,
            interceptor: nil,
            requestModifier: nil)
        .responseDecodable(of: CommentResult.self) { data in
            completion(true, data.value)
        }
    }
    
    func test(id: String) {
        AF.request(
            baseUrl + "songs/\(id)/comments",
            method: .get,
            headers: headers,
            interceptor: nil,
            requestModifier: nil).response { response in
                debugPrint(response)
            }
    }
}
