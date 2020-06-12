//
//  PlayerView.swift
//  W3MusicPlayer
//
//  Created by Mac on 2020/6/9.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit

class PlayerView: UIView {

    let KScreenWidth = UIScreen.main.bounds.size.width
    let progressBarHeight = CGFloat(2)
    
    lazy var progressBar: UIView = {
        let progressBar = UIView()
        progressBar.backgroundColor = #colorLiteral(red: 0.9693509936, green: 0.9561541677, blue: 0.9305579066, alpha: 1)
        return progressBar
    }()
    
    lazy var progressBar_active: UIView = {
        let progressBar_active = UIView()
        progressBar_active.backgroundColor = #colorLiteral(red: 0.8785236478, green: 0.6838183999, blue: 0.00450915331, alpha: 1)
        return progressBar_active
    }()
    
    lazy var albumView: UIImageView = {
        let albumView = UIImageView()
        albumView.image = #imageLiteral(resourceName: "markus-spiske-80BnaHKhKuQ-unsplash")
        return albumView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = #colorLiteral(red: 0.1389503181, green: 0.1389503181, blue: 0.1389503181, alpha: 1)
        titleLabel.text = "title"
        return titleLabel
    }()
    
    lazy var subTitleLabel: UILabel = {
        let subTitleLabel = UILabel()
        subTitleLabel.textColor = #colorLiteral(red: 0.4321339726, green: 0.4321339726, blue: 0.4321339726, alpha: 1)
        subTitleLabel.text = "subtitle"
        return subTitleLabel
    }()
    
    lazy var playBtn : UIButton = {
        var playBtn = UIButton()
        playBtn.backgroundColor = #colorLiteral(red: 0.9554899335, green: 0.8026843667, blue: 0.2501378059, alpha: 1)
        playBtn.setImage(UIImage(systemName: "play.fill") , for: .normal)
        playBtn.tintColor = .white
        playBtn.addTarget(nil, action: #selector(playPauseEvent), for: .touchUpInside)
        return playBtn
    }()
    
    lazy var playerCellView: UIView = {
        let playerCellView = UIView()
        playerCellView.backgroundColor = #colorLiteral(red: 0.9932326674, green: 0.9800683856, blue: 0.9437442422, alpha: 1)
        playerCellView.addSubview(progressBar)
        
        return playerCellView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        addSubview(playerCellView)
        addSubview(progressBar)
        addSubview(progressBar_active)
        addSubview(albumView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(playBtn)
        
        initializeLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeLayout() {
        
        playerCellView.snp.makeConstraints { (make) -> Void in
            make.left.right.top.bottom.equalTo(self)
        }
        
        progressBar.snp.makeConstraints { (make) -> Void in
            make.left.right.equalTo(self)
            make.top.equalTo(self)
            make.height.equalTo(progressBarHeight)
        }
        
        progressBar_active.snp.makeConstraints { (make) -> Void in
            make.left.top.bottom.equalTo(progressBar)
            make.width.equalTo(1)
        }

        albumView.snp.makeConstraints { (make) -> Void in
            make.left.bottom.equalTo(self)
            make.width.height.equalTo(self.snp.height).offset(-progressBarHeight)
        }
        
        playBtn.snp.makeConstraints { (make) -> Void in
            make.right.bottom.equalTo(self)
            make.width.height.equalTo(self.snp.height).offset(-progressBarHeight)
        }
        
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(albumView.snp.right).offset(10)
            make.right.equalTo(playBtn.snp.left).offset(-10)
            make.top.equalTo(self).offset(5)
            make.height.equalTo(self).dividedBy(2).offset(-5)
        }
        
        subTitleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.right.width.height.equalTo(titleLabel)
        }
    }
    
    @objc func playPauseEvent() {
        
    }
}
