//
//  BandView.swift
//  W3MusicPlayer
//
//  Created by Mac on 2020/5/25.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit

class BandView: UIView {
    
    var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            CGColor(srgbRed: 1, green: 1, blue: 1, alpha: 0),
            CGColor(srgbRed: 1, green: 1, blue: 1, alpha: 0.45),
            CGColor(srgbRed: 1, green: 1, blue: 1, alpha: 0.9)
        ]
        gradientLayer.cornerRadius = 8
        return gradientLayer
    }()
    
    let bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.layer.masksToBounds = true
        bgImageView.layer.cornerRadius = 8
        return bgImageView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 1
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textColor = #colorLiteral(red: 0.2423548102, green: 0.2423548102, blue: 0.2423548102, alpha: 1)
        return titleLabel
    }()
    
    let subTitleLabel: UILabel = {
        let subTitleLabel = UILabel()
        subTitleLabel.textColor = .white
        subTitleLabel.numberOfLines = 2
        subTitleLabel.font = .systemFont(ofSize: 16)
        subTitleLabel.textColor = #colorLiteral(red: 0.2423548102, green: 0.2423548102, blue: 0.2423548102, alpha: 1)
        return subTitleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 8
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 12)
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.1
        layer.borderColor = UIColor(white: 0, alpha: 0.1).cgColor
        layer.borderWidth = 0.5
        
        addSubview(bgImageView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        layer.insertSublayer(gradientLayer, at: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populate(bandData data: BandData) {
        bgImageView.image = UIImage(named: data.imageName)
        titleLabel.text = data.title
        subTitleLabel.text = data.subTitle
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgImageView.frame = bounds
        let BgHeight = bounds.size.height*0.6
        gradientLayer.frame = CGRect(x: 0, y: bounds.size.height-BgHeight, width: bounds.size.width, height: BgHeight)
        
        subTitleLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.snp_bottomMargin).offset(-5)
            make.left.equalTo(self.snp_leftMargin).offset(5)
            make.right.equalTo(self.snp_rightMargin).offset(-5)
        }
        
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(subTitleLabel.snp_topMargin).offset(-10)
            make.left.equalTo(self.snp_leftMargin).offset(5)
            make.right.equalTo(self.snp_rightMargin).offset(5)
        }
    }
}
