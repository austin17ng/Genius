//
//  SearchViewController.swift
//  Genius
//
//  Created by Nguyễn Tùng on 07/07/2022.
//

import UIKit
import Alamofire
import Kingfisher

class SearchViewController: UIViewController {
    private let cellHeight = 80
    
    var viewModel = SearchViewModel()
    
    var topResult: [Hit] = []
    var songs: [Hit] = []
    var lyrics: [Hit] = []
    var artists: [Hit] = []
    var albums: [Hit] = []
    
    var hits: [[Hit]] {
        get {
            return [
                topResult,
                songs,
                lyrics,
                artists,
                albums
            ]
        }
    }
    var sectionNames = ["Top Result", "Song", "Lyric", "Artist", "Album"]
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ArtistTableViewCell.nib, forCellReuseIdentifier: ArtistTableViewCell.identifier)
        tableView.register(SongTableViewCell.cellNib, forCellReuseIdentifier: SongTableViewCell.cellIdentifier)
        tableView.register(AlbumTableViewCell.nib, forCellReuseIdentifier: AlbumTableViewCell.identifier)
        
        loadingIndicator.hidesWhenStopped = true
        
        title = "Genius"
    }
    
    func navigateToSongDetail(id: String) {
        let songDetail = SongDetailViewController()
        songDetail.id = id
        navigationController?.pushViewController(songDetail, animated: true)
    }
    
    func search(term: String) {
        Task.init {
            do {
                loadingIndicator.startAnimating()
                let multiSearchResult = try await viewModel.multiSearch(term: term)
                let sections = multiSearchResult.response?.sections
                
                topResult = sections?.first(where: { section in
                        let type = section.type ?? ""
                        return type.lowercased() == "top_hit"
                    })?.hits ?? []
                
                songs = sections?.first(where: { section in
                        let type = section.type ?? ""
                        return type.lowercased() == "song"
                    })?.hits ?? []
                
                lyrics = sections?.first(where: { section in
                        let type = section.type ?? ""
                        return type.lowercased() == "lyric"
                    })?.hits ?? []
                
                artists = sections?.first(where: { section in
                        let type = section.type ?? ""
                        return type.lowercased() == "artist"
                    })?.hits ?? []
                
                albums = sections?.first(where: { section in
                        let type = section.type ?? ""
                        return type.lowercased() == "album"
                    })?.hits ?? []
                
                
                loadingIndicator.stopAnimating()
                tableView.reloadData()
            }
        }
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(cellHeight)
    }
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return hits[section].count != 0 ? sectionNames[section] : ""
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hits[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hit = hits[indexPath.section][indexPath.row]
        if (hit.type?.lowercased() ?? "" == "artist") {
            let cell = tableView.dequeueReusableCell(withIdentifier: ArtistTableViewCell.identifier) as! ArtistTableViewCell
            
            cell.nameLabel.text = hit.result?.name
            cell.img.layer.cornerRadius = CGFloat((cellHeight - 2*20)/2)
            cell.clipsToBounds = true
            
            if let urlStr = hit.result?.header_image_url {
                let url = URL(string: urlStr)
                cell.img.kf.setImage(with: url)
            }
            
            return cell
        } else if (hit.type?.lowercased() ?? "" == "album") {
            let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.identifier) as! AlbumTableViewCell
            
            cell.name.text = hit.result?.full_title
            if let urlStr = hit.result?.cover_art_thumbnail_url {
                let url = URL(string: urlStr)
                cell.img.kf.setImage(with: url)
            }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: SongTableViewCell.cellIdentifier) as! SongTableViewCell
            
            cell.nameLabel.text = hit.result?.title
            cell.artistLabel.text = hit.result?.artist_names
            if let urlStr = hit.result?.header_image_url {
                let url = URL(string: urlStr)
                cell.img.kf.setImage(with: url)
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hit = hits[indexPath.section][indexPath.row]
        guard let id = hit.result?.id, let label = hit.type?.lowercased() else {return}
        if (label == "song" || label == "lyric") {
            navigateToSongDetail(id: String(id))
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchText = searchBar.text ?? ""
        print(searchText)
        search(term: searchText)
    }
}
