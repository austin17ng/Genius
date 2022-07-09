//
//  LyricsTableViewCell.swift
//  Genius
//
//  Created by Nguyễn Tùng on 08/07/2022.
//

import UIKit

class LyricsTableViewCell: UITableViewCell {
    static let nib = UINib(nibName: "LyricsTableViewCell", bundle: .main)
    static let identifier = "LyricsTableViewCell"
    
    @IBOutlet weak var lyricsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
