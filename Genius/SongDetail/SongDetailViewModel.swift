//
//  SongDetailViewModel.swift
//  Genius
//
//  Created by Nguyễn Tùng on 07/07/2022.
//

import Foundation

class SongDetailViewModel {    
    func fetchSong(id: String, completion: @escaping (_ sucess: Bool, _ result: SongResult?) -> Void) {
        Api.shared.fetchSong(id: id) { sucess, result in
            completion(sucess, result)
        }
    }
    
    func fetchLyrics(id: String, completion: @escaping (_ sucess: Bool, _ result: SongLyricsResult?) -> Void) {
        Api.shared.fetchLyrics(id: id) { success, result in
            completion(success, result)
        }
    }
    
    func fetchComments(id: String, completion: @escaping (_ sucess: Bool, _ result: CommentResult?) -> Void) {
        Api.shared.fetchComments(id: id) { sucess, result in
            completion(sucess, result)
        }
    }
}
