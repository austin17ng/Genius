//
//  CommentTableViewCell.swift
//  Genius
//
//  Created by Nguyễn Tùng on 08/07/2022.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    static let nib = UINib(nibName: "CommentTableViewCell", bundle: .main)
    static let identifier = "CommentTableViewCell"
    
    
    @IBOutlet weak var avatarImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iqLabel: UILabel!
    @IBOutlet weak var timstampLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var votesTotalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImg.layer.cornerRadius = avatarImg.bounds.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
