//
//  AlbumTableViewCell.swift
//  Genius
//
//  Created by Nguyễn Tùng on 09/07/2022.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    static let nib = UINib(nibName: "AlbumTableViewCell", bundle: .main)
    static let identifier = "AlbumTableViewCell"
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
