//
//  RecommendTableViewCell.swift
//  W3MusicPlayer
//
//  Created by Mac on 2020/5/24.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit

class RecommendTableViewCell: UITableViewCell {

    @IBOutlet weak var forYouBtn: UIButton!
    @IBOutlet weak var discoveryBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
