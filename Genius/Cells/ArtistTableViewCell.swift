//
//  ArtistTableViewCell.swift
//  Genius
//
//  Created by Nguyễn Tùng on 09/07/2022.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {
    static let nib = UINib(nibName: "ArtistTableViewCell", bundle: .main)
    static let identifier = "ArtistTableViewCell"
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
