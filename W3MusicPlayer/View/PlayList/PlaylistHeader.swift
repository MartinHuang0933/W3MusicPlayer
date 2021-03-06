//
//  PlaylistHeader.swift
//  W3MusicPlayer
//
//  Created by Mac on 2020/5/29.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit

class PlaylistHeader: UIView {
    
    let KScreenWidth = UIScreen.main.bounds.size.width
    var bannerHeight = CGFloat(230)
    let bannerMinHeight = CGFloat(130)
    let bannerBottomPadding = CGFloat(20)
    let playBtnWH = CGFloat(50)
    
    lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: KScreenWidth, height: bannerHeight)
        gradientLayer.colors = [
            CGColor(srgbRed: 0.3, green: 0.3, blue: 0.3, alpha: 0),
            CGColor(srgbRed: 0.35, green: 0.35, blue: 0.35, alpha: 0.05),
            CGColor(srgbRed: 0.4, green: 0.4, blue: 0.4, alpha: 0.25)
        ]
        
        return gradientLayer
    }()
    
    lazy var headImageView: UIImageView = {
        let headImageView = UIImageView()
        headImageView.frame = CGRect.init(x: 0, y: 0, width: KScreenWidth, height: bannerHeight)
        headImageView.contentMode = .scaleAspectFill
        headImageView.clipsToBounds = true
        return headImageView
    }()
    
    lazy var followBtn : UIButton = {
        var followBtn = UIButton()
        followBtn.layer.cornerRadius = 18
        followBtn.backgroundColor = #colorLiteral(red: 0.9554899335, green: 0.8026843667, blue: 0.2501378059, alpha: 1)
        followBtn.setTitle("Following", for: .normal)
        followBtn.addTarget(nil, action: #selector(click), for: .touchUpInside)
        return followBtn
    }()
    
    lazy var playBtn : UIButton = {
        let width = 46;
        var playBtn = UIButton()
        playBtn.layer.cornerRadius = playBtnWH * 0.5
        playBtn.backgroundColor = #colorLiteral(red: 0.9554899335, green: 0.8026843667, blue: 0.2501378059, alpha: 1)
        playBtn.setImage(UIImage(systemName: "play.fill") , for: .normal)
        playBtn.tintColor = .white
        playBtn.addTarget(nil, action: #selector(click), for: .touchUpInside)
        return playBtn
    }()
    
    var titleLabel : UILabel = {
        var titleLabel = UILabel()
        titleLabel.frame = CGRect.init(x: 20, y: 25, width: 300, height: 75)
        titleLabel.font = UIFont(name: "Helvetica Bold", size: 26)
        titleLabel.numberOfLines = 2;
        titleLabel.textColor = .white
        CommonFunction.sharedInstance.setLabelShadow(label: titleLabel);
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(.dm, light: .white, dark: .red)
        addSubview(headImageView)
        addSubview(titleLabel)
        addSubview(followBtn)
        addSubview(playBtn)
        headImageView.layer.insertSublayer(gradientLayer, at: 1)
        
        followBtn.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(100)
            make.bottom.equalTo(self.snp_bottomMargin).offset(-10)
            make.left.equalTo(self.snp_leftMargin).offset(20)
        }
        
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(followBtn.snp_topMargin).offset(-15)
            make.left.equalTo(followBtn.snp_leftMargin)
        }
        
        playBtn.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(playBtnWH)
            make.centerY.equalTo(self.snp.bottom)
            make.right.equalTo(self.snp_rightMargin).offset(-12)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populate(headerData data: PlayListHeaderData) {
        titleLabel.text = data.title
        headImageView.image = UIImage.init(named: data.imageName)
        bannerHeight = data.BannerHeight
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        gradientLayer.frame = self.bounds
        CATransaction.commit()
    }
    
    func layoutChange(_ offsetY: CGFloat) {
        if offsetY <= -bannerMinHeight  {
            let frame = CGRect.init(x: 0, y: 0, width: KScreenWidth, height: bannerHeight+(-offsetY-bannerHeight)-bannerBottomPadding)
            self.frame = frame
            headImageView.frame = frame
        }
        if (-offsetY > bannerHeight){
            let frame = CGRect.init(x: 0, y: 0, width: KScreenWidth, height: bannerHeight+(-offsetY-bannerHeight)-bannerBottomPadding)
            self.frame = frame
            headImageView.frame = frame
        }
        headImageView.roundCorners(corners: [.bottomLeft], radius: 45.0)
    }
}

extension PlaylistHeader {
    @objc func click() {
        print(2312313213);
    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
