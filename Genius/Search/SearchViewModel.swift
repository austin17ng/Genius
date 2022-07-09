//
//  SearchViewModel.swift
//  Genius
//
//  Created by Nguyễn Tùng on 07/07/2022.
//

import Foundation

final class SearchViewModel {
    func search(term: String) async throws -> SearchResult{
        return try await Api.shared.search(term: term)
    }
    
    func multiSearch(term: String) async throws -> MultiSearchResult {
        return try await Api.shared.multiSearch(term: term)
    }
}
