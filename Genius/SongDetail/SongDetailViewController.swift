//
//  SongDetailViewController.swift
//  Genius
//
//  Created by Nguyễn Tùng on 07/07/2022.
//

import UIKit

class SongDetailViewController: UIViewController {
    let viewModel = SongDetailViewModel()
    
    var comments: [Comment] = []
    var lyrics = ""
    var song: Song?
    var id: String?
    
    let spaceBeetweenSections = 20
    
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        table.register(HeaderTableViewCell.nib, forCellReuseIdentifier: HeaderTableViewCell.identifier)
        table.register(LyricsTableViewCell.nib, forCellReuseIdentifier: LyricsTableViewCell.identifier)
        table.register(CommentTableViewCell.nib, forCellReuseIdentifier: CommentTableViewCell.identifier)
        
        table.delegate = self
        table.dataSource = self
        
        fetchSong()
        fetchLyrics()
        fetchComments()
    }
    
    func fetchSong() {
        viewModel.fetchSong(id: id!) { [self] sucess, result in
            if (sucess) {
                guard let songResult = result?.response?.song else {return}
                self.song = songResult
                self.table.reloadSections([0], with: .none)
                print(self.song?.title)
            }
        }
    }
    
    func fetchLyrics() {
        viewModel.fetchLyrics(id: id!) { sucess, result in
            guard let lyricsResult = result?.response?.lyrics?.lyrics?.body?.plain else {return}
            self.lyrics = lyricsResult
            self.table.reloadSections([1], with: .none)
            print(self.lyrics)
        }
    }
    
    func fetchComments() {
        viewModel.fetchComments(id: id!) { sucess, result in
            guard let commentsResult = result?.response?.comments else {return}
            self.comments = commentsResult
            self.table.reloadSections([2], with: .none)
            for comment in self.comments {
                print(comment.body?.plain)
            }
        }
    }
}


extension SongDetailViewController:  UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return comments.count
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier, for: indexPath) as! HeaderTableViewCell
            
            cell.titleLabel.text = song?.title
            cell.artistLabel.text = song?.artist_names
            cell.plotLabel.text = song?.description_preview
            if let urlStr = song?.custom_header_image_url {
                let url = URL(string: urlStr)
                cell.img.kf.setImage(with: url)
                
            }
            
            return cell
        }
        else if (indexPath.section == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: LyricsTableViewCell.identifier, for: indexPath) as! LyricsTableViewCell
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            cell.lyricsLabel.text = lyrics
            return cell
        }
        else if (indexPath.section == 2) {
            let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.identifier, for: indexPath) as! CommentTableViewCell
            let comment = comments[indexPath.row]
            
            cell.contentLabel.text = comment.body?.plain
            cell.nameLabel.text = comment.author?.name
            cell.iqLabel.text = String(comment.author?.iq ?? 0)
            cell.votesTotalLabel.text = String(comment.votes_total ?? 0)
            
            if let urlStr = comment.author?.header_image_url {
                let url = URL(string: urlStr)
                cell.avatarImg.kf.setImage(with: url)
            }
            
            if let time = comment.created_at {
                cell.timstampLabel.text = formatDate(time: time)
            }
            
            return cell
        }
        return UITableViewCell()
    }
}

extension SongDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (section == 2) {
            return 0
        }
        return CGFloat(spaceBeetweenSections)
    }
}
