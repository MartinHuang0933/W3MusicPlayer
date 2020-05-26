//
//  SingerView.swift
//  W3MusicPlayer
//
//  Created by Mac on 2020/5/26.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit

class SingerView: UIView {
    
    let bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.layer.masksToBounds = true
        bgImageView.layer.cornerRadius = 55
        return bgImageView
    }()
    
    let singerLabel: UILabel = {
        let singerLabel = UILabel()
        singerLabel.font = .boldSystemFont(ofSize: 17)
        singerLabel.textColor = #colorLiteral(red: 0.2423548102, green: 0.2423548102, blue: 0.2423548102, alpha: 1)
        singerLabel.textAlignment = .center
        CommonFunction.sharedInstance.setLabelShadow(label: singerLabel);
        return singerLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 50
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 12)
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.1
        layer.borderColor = UIColor(white: 0, alpha: 0.1).cgColor
        layer.borderWidth = 0.5
        
        addSubview(bgImageView)
        addSubview(singerLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populate(singerData data: SingerData) {
        bgImageView.image = UIImage(named: data.imageName)
        singerLabel.text = data.title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgImageView.frame = bounds
        
        singerLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(bgImageView)
            make.height.equalTo(20)
            make.width.equalTo(bgImageView)
            make.top.equalTo(bgImageView.snp_bottomMargin).offset(16)
        }
    }
}
