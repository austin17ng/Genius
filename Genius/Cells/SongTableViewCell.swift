//
//  SongTableViewCell.swift
//  Genius
//
//  Created by Nguyễn Tùng on 07/07/2022.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    static let cellIdentifier = "SongTableViewCell"
    static let cellNib = UINib(nibName: "SongTableViewCell", bundle: .main)
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
