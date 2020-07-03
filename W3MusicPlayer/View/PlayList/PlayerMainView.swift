//
//  PlayerMainView.swift
//  W3MusicPlayer
//
//  Created by Mac on 2020/6/10.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit
import AVFoundation

protocol PlayerMainViewDelegate {
    func didClosePlayer()
    func didPlayBtnClick()
    func didPauseBtnClick()
    func didNextBtnClick()
    func didLoopBtnClick()
    func didBackBtnClick()
}

class PlayerMainView: UIView {
    
    var delegate: PlayerMainViewDelegate!
    let KScreenWidth = UIScreen.main.bounds.size.width
    let RLSideMargin = CGFloat(15)
    let topMargin = CGFloat(30)
    let lineHeight = CGFloat(20)
    let itemBtnWH = CGFloat(40)
    let bigItemBtnWH = CGFloat(40)
    let btnTintColor = #colorLiteral(red: 0.9568627451, green: 0.8039215686, blue: 0.2509803922, alpha: 1)
    
    let avplayer = AVPlayer()
    var playerItem:AVPlayerItem = {
        let fileUrl = Bundle.main.url(forResource: "Le_Freak", withExtension: "mp3")!
        let playerItem = AVPlayerItem(url: fileUrl)
        return playerItem
    }()
    
    // infoView
    
    lazy var closeBtn: UIButton = {
        let closeBtn = UIButton()
        closeBtn.setImage(UIImage(systemName: "chevron.down") , for: .normal)
        closeBtn.tintColor = btnTintColor
        closeBtn.addTarget(nil, action: #selector(closePlayer), for: .touchUpInside)
        return closeBtn
    }()
    
    lazy var nowPlayLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = #colorLiteral(red: 0.9568627451, green: 0.8039215686, blue: 0.2509803922, alpha: 1)
        titleLabel.text = "title"
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    lazy var moreBtn: UIButton = {
        let moreBtn = UIButton()
        moreBtn.setImage(UIImage(systemName: "ellipsis") , for: .normal)
        moreBtn.tintColor = btnTintColor
        closeBtn.addTarget(nil, action: #selector(closePlayer), for: .touchUpInside)
        return moreBtn
    }()
    
    lazy var songView: UIImageView = {
        let albumView = UIImageView()
        albumView.image = #imageLiteral(resourceName: "markus-spiske-80BnaHKhKuQ-unsplash")
        return albumView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = #colorLiteral(red: 0.1389503181, green: 0.1389503181, blue: 0.1389503181, alpha: 1)
        titleLabel.text = "title"
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    lazy var subTitleLabel: UILabel = {
        let subTitleLabel = UILabel()
        subTitleLabel.textColor = #colorLiteral(red: 0.4321339726, green: 0.4321339726, blue: 0.4321339726, alpha: 1)
        subTitleLabel.text = "subtitle"
        subTitleLabel.textAlignment = .center
        return subTitleLabel
    }()
    
    lazy var infoView: UIView = {
        let infoView = UIView()
        infoView.alpha = 0
//        infoView.isHidden = true
        infoView.backgroundColor = #colorLiteral(red: 0.9932326674, green: 0.9800683856, blue: 0.9437442422, alpha: 1)
        infoView.addSubview(closeBtn)
        infoView.addSubview(nowPlayLabel)
        infoView.addSubview(moreBtn)
        infoView.addSubview(songView)
        infoView.addSubview(titleLabel)
        infoView.addSubview(subTitleLabel)
        return infoView
    }()
    
    // controllView
    
    lazy var playStatusView: UIView = {
        let playStatusView = UIView()
        playStatusView.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        return playStatusView
    }()
    
    lazy var repeatBtn: UIButton = {
        let repeatBtn = UIButton()
        repeatBtn.setImage(UIImage(systemName: "repeat") , for: .normal)
        repeatBtn.tintColor = btnTintColor
        repeatBtn.addTarget(nil, action: #selector(loopBtnClick), for: .touchUpInside)
        return repeatBtn
    }()
    
    lazy var likeBtn: UIButton = {
        let likeBtn = UIButton()
        likeBtn.setImage(UIImage(systemName: "heart.fill") , for: .normal)
        likeBtn.tintColor = btnTintColor
        //likeBtn.addTarget(nil, action: #selector(closePlayer), for: .touchUpInside)
        return likeBtn
    }()
    
    lazy var randomBtn: UIButton = {
        let randomBtn = UIButton()
        randomBtn.setImage(UIImage(systemName: "shuffle") , for: .normal)
        randomBtn.tintColor = btnTintColor
        //randomBtn.addTarget(nil, action: #selector(closePlayer), for: .touchUpInside)
        return randomBtn
    }()
    
    lazy var preSongBtn: UIButton = {
        let preSongBtn = UIButton()
        preSongBtn.setImage(UIImage(systemName: "backward.fill") , for: .normal)
        preSongBtn.tintColor = btnTintColor
        preSongBtn.addTarget(nil, action: #selector(backBtnClick), for: .touchUpInside)
        return preSongBtn
    }()
    
    lazy var nextSongBtn: UIButton = {
        let nextSongBtn = UIButton()
        nextSongBtn.setImage(UIImage(systemName: "forward.fill") , for: .normal)
        nextSongBtn.tintColor = btnTintColor
        nextSongBtn.addTarget(nil, action: #selector(nextBtnClick), for: .touchUpInside)
        return nextSongBtn
    }()
    
    lazy var playBtn: UIButton = {
        let playBtn = UIButton()
        playBtn.setImage(UIImage(systemName: "play.fill") , for: .normal)
        playBtn.tintColor = btnTintColor
        playBtn.addTarget(nil, action: #selector(playBtnClick), for: .touchUpInside)
        return playBtn
    }()
    
    let player = PlayerView()
    
    lazy var controllView: UIView = {
        let controllView = UIView()
        controllView.alpha = 0
//        controllView.isHidden = true
        controllView.backgroundColor = #colorLiteral(red: 0.9932326674, green: 0.9800683856, blue: 0.9437442422, alpha: 1)
        controllView.addSubview(playStatusView)
        controllView.addSubview(repeatBtn)
        controllView.addSubview(likeBtn)
        controllView.addSubview(randomBtn)
        controllView.addSubview(preSongBtn)
        controllView.addSubview(nextSongBtn)
        controllView.addSubview(playBtn)
        return controllView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(player)
        addSubview(infoView)
        addSubview(controllView)
        
        initializeLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeLayout() {
        
        player.snp.makeConstraints { (make) -> Void in
            make.left.right.top.width.equalTo(self)
            make.height.equalTo(50)
        }
        
        infoView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self)
            make.left.right.equalTo(self)
            make.height.equalTo(self).dividedBy(2)
        }
        
        closeBtn.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(infoView).offset(RLSideMargin)
            make.top.equalTo(infoView).offset(topMargin)
            make.width.height.equalTo(itemBtnWH)
        }
        
        moreBtn.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(infoView).offset(-RLSideMargin)
            make.top.equalTo(infoView).offset(topMargin)
            make.width.height.equalTo(itemBtnWH)
        }
        
        nowPlayLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(closeBtn.snp.right).offset(5)
            make.right.equalTo(moreBtn.snp.left).offset(-5)
            make.top.equalTo(infoView).offset(topMargin)
            make.height.equalTo(lineHeight)
        }
        
        songView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(nowPlayLabel.snp.bottom).offset(topMargin)
            make.centerX.equalTo(infoView)
            make.width.height.equalTo(150)
        }
        
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(songView.snp.bottom).offset(topMargin)
            make.centerX.equalTo(infoView)
            make.width.equalTo(KScreenWidth)
            make.height.equalTo(lineHeight)
        }
        
        subTitleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.centerX.equalTo(infoView)
            make.width.equalTo(KScreenWidth)
            make.height.equalTo(lineHeight)
        }
        
        controllView.snp.makeConstraints { (make) -> Void in
            make.top.top.equalTo(infoView.snp.bottom)
            make.left.right.equalTo(self)
            make.height.equalTo(self).dividedBy(2)
        }
        
        playStatusView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(controllView.snp.top).offset(topMargin)
            make.left.equalTo(controllView).offset(RLSideMargin)
            make.right.equalTo(controllView).offset(-RLSideMargin)
            make.height.equalTo(30)
        }
        
        likeBtn.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(playStatusView.snp.bottom).offset(50)
            make.centerX.equalTo(controllView)
            make.width.height.equalTo(itemBtnWH)
        }
        
        repeatBtn.snp.makeConstraints { (make) -> Void in
            make.top.width.height.equalTo(likeBtn)
            make.right.equalTo(likeBtn.snp.left).offset(-30)
        }
        
        randomBtn.snp.makeConstraints { (make) -> Void in
            make.top.width.height.equalTo(likeBtn)
            make.left.equalTo(likeBtn.snp.right).offset(30)
        }
        
        playBtn.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(likeBtn.snp.bottom).offset(60)
            make.centerX.equalTo(controllView)
            make.width.height.equalTo(bigItemBtnWH)
        }
        
        preSongBtn.snp.makeConstraints { (make) -> Void in
            make.top.width.height.equalTo(playBtn)
            make.right.equalTo(playBtn.snp.left).offset(-45)
        }
        
        nextSongBtn.snp.makeConstraints { (make) -> Void in
            make.top.width.height.equalTo(playBtn)
            make.left.equalTo(playBtn.snp.right).offset(45)
        }
    }
    
    func showMainView() {
        setMainViewAlpha(alpha: 1)
    }
    
    func hideMainView() {
        setMainViewAlpha(alpha: 0)
    }
    
    func setMainViewAlpha(alpha:CGFloat) {
        self.infoView.alpha = alpha
        self.controllView.alpha = alpha
        self.player.alpha = 1 - alpha*0.5
    }
    
    @objc func closePlayer() {
        delegate.didClosePlayer()
    }
    
    @objc func playBtnClick() {
        print("playBtnClick");
        avplayer.replaceCurrentItem(with: playerItem)
        print(avplayer)
        print(playerItem)
        if avplayer.rate == 0 {
//          PlayerButton.setImage(UIImage(named: “pause.png”), for: .normal)
          avplayer.play()
        }
        else {
//          PlayerButton.setImage(UIImage(named: “play.png”), for: .normal)
          avplayer.pause()
        }
        
        
//        let player22 = AVPlayer()
//        let fileUrl22 = Bundle.main.url(forResource: "Le_Freak", withExtension: "mp3")!
//        let playerItem22 = AVPlayerItem(url: fileUrl22)
//        player22.replaceCurrentItem(with: playerItem22)
//        player22.play()
    }
    
    @objc func pauseBtnClick() {
        print("pauseBtnClick");
    }
    
    @objc func nextBtnClick() {
        print("nextBtnClick");
    }
    
    @objc func loopBtnClick() {
        print("loopBtnClick");
    }
    
    @objc func backBtnClick() {
        print("backBtnClick");
    }
}
