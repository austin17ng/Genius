//
//  HeaderTableViewCell.swift
//  Genius
//
//  Created by Nguyễn Tùng on 08/07/2022.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    static let nib = UINib(nibName: "HeaderTableViewCell", bundle: .main)
    static let identifier = "HeaderTableViewCell"

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var plotLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let width = UIScreen.main.bounds.width
        img.addoverlay()
        contentView.widthAnchor.constraint(equalToConstant: width).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: width*2/3).isActive = true
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
