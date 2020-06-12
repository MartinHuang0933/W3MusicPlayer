//
//  PlayListTableViewCell.swift
//  W3MusicPlayer
//
//  Created by Mac on 2020/5/27.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit

class PlayListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var isPlayingBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setModel(model:PlayListCellData) {
        self.titleLabel.text = model.title
        self.subTitleLabel.text = model.subTitle
        self.timeLabel.text = model.time
        
        if model.like {
            self.likeBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }else{
            self.likeBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
        if model.isPlaying {
            self.isPlayingBtn.isHidden = false
        }else{
            self.isPlayingBtn.isHidden = true
        }
        
        self.backgroundColor = UIColor(.dm, light: .white, dark: .red)
    }
}
