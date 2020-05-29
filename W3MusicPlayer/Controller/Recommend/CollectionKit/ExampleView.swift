//
//  ExampleView.swift
//  CollectionKitExample
//
//  Created by Luke Zhao on 2017-09-04.
//  Copyright © 2017 lkzhao. All rights reserved.
//

import UIKit
import CollectionKit

class ExampleView: UIView {
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.textColor = .white
        CommonFunction.sharedInstance.setLabelShadow(label: titleLabel);
        
        return titleLabel
    }()
    
    let titleBottomBorder: UIView = {
        let cardView = UIView()
        cardView.backgroundColor = .white
        return cardView
    }()
    
    let cardView: UIView = {
        let cardView = UIView()
        cardView.backgroundColor = .clear
        return cardView
    }()
    
    private var contentVC: UIViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(titleBottomBorder)
        addSubview(cardView)
    }
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = titleLabel.sizeThatFits(bounds.size)
        titleLabel.frame = CGRect(origin: CGPoint(x: 15, y: 10), size: size)
        let labelHeight = titleLabel.frame.maxY + 30
        cardView.frame = CGRect(x: 0, y: labelHeight, width: bounds.width, height: bounds.height - labelHeight)
        contentVC?.view.frame = cardView.bounds
        
        titleBottomBorder.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(titleLabel)
            make.height.equalTo(3)
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(9)
        }
    }
    
    func populate(title: String,
                  contentViewControllerType: UIViewController.Type) {
        titleLabel.text = title
        contentVC?.view.removeFromSuperview()
        contentVC = contentViewControllerType.init()
        let contentView = contentVC!.view!
        contentView.clipsToBounds = true
        cardView.addSubview(contentView)
        setNeedsLayout()
    }
}
