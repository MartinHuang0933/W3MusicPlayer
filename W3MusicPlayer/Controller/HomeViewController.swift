//
//  HomeViewController.swift
//  W3MusicPlayer
//
//  Created by Mac on 2020/5/22.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit
//import BATabBarController

class HomeViewController: UIViewController {

    let baTabBarController = BATabBarController()
    let player = PlayerMainView()
    
    var beginPoint : CGFloat = 0.0
    var beginplayerY : CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initTabBar()
        self.initPlayer()
    }
    
    func initTabBar(){
        let vc1 = RecommendViewController()
        let vc2 = PlayListViewController()
        let vc3 = UIViewController()
        let navigationController = UINavigationController(rootViewController: vc1)
        let navigationControlle2 = UINavigationController(rootViewController: vc2)
        
        let option1 = NSMutableAttributedString(string: "Feed")
        option1.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: option1.length))
        let tabBarItem  = BATabBarItem(image: UIImage(named: "icon1_unselected")!, selectedImage: UIImage(named: "icon1_selected")!, title: option1)
        let tabBarItem2 = BATabBarItem(image: UIImage(named: "icon2_unselected")!, selectedImage: UIImage(named: "icon2_selected")!, title: option1)
        let tabBarItem3 = BATabBarItem(image: UIImage(named: "icon3_unselected")!, selectedImage: UIImage(named: "icon3_selected")!, title: option1)

        baTabBarController.viewControllers = [navigationControlle2, navigationController, vc3]
        baTabBarController.tabBarItems = [tabBarItem, tabBarItem2, tabBarItem3]
        baTabBarController.delegate = self
        baTabBarController.tabBarBackgroundColor = #colorLiteral(red: 0.9432541728, green: 0.8550474048, blue: 0.4141118824, alpha: 1)
        
        self.view.addSubview(baTabBarController.view)
    }
    
    func initPlayer(){
        
        self.view.addSubview(player)
        player.delegate = self
        player.snp.makeConstraints { (make) -> Void in
            make.left.right.equalTo(self.view)
            make.top.equalTo(baTabBarController.tabBar!.snp.top).offset(-50)
            make.height.equalTo(playerHeight)
        }
        let tapGesture = UITapGestureRecognizer(target: self, action:  #selector (self.showPlayer))
        player.addGestureRecognizer(tapGesture)
        let dragGesture = UIPanGestureRecognizer(target: self, action:  #selector (self.dragPlayer))
        player.addGestureRecognizer(dragGesture)
    }
    
    @objc func showPlayer(){
        self.resizePlayer(isShow: true)
    }
    @objc func hidePlayer(){
        self.resizePlayer(isShow: false)
    }
    @objc func dragPlayer(sender:UIPanGestureRecognizer){
        self.dragResizePlayer(sender: sender)
    }
    
    func resizePlayer(isShow:Bool){
        if isShow {
            self.player.snp.remakeConstraints { (make) -> Void in
                make.left.right.top.equalTo(self.view)
                make.height.equalTo(self.view)
            }
        }else{
            self.player.snp.remakeConstraints { (make) -> Void in
                make.left.right.equalTo(self.view)
                make.top.equalTo(baTabBarController.tabBar!.snp.top).offset(-50)
                make.height.equalTo(50)
            }
        }
        // 告诉self.view约束需要更新
        self.view.needsUpdateConstraints()
        // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
        self.view.updateConstraintsIfNeeded()
    
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.2, delay: 0, animations: {
            if isShow {
                self.player.showMainView()
            }else{
                self.player.hideMainView()
            }
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    
    
    func dragResizePlayer(sender:UIPanGestureRecognizer){
        
        let windowHeight = UIScreen.main.bounds.size.height
        let bottomMargin = baTabBarController.tabBar!.frame.origin.y - 65
        let pointY = sender.location(in: self.view.window).y
        
        if(pointY <= bottomMargin)
        {
            if (sender.state) == .began{
                beginPoint = pointY
                beginplayerY = player.frame.origin.y
            }
            let pointDifference = pointY - beginPoint
            if(beginplayerY+pointDifference > 0){
                player.snp.remakeConstraints { (make) -> Void in
                    make.top.equalTo(beginplayerY).offset(pointDifference)
                    make.left.right.equalTo(self.view)
                    make.height.equalTo(self.view)
                }
                
                let alpha = 1 - (0.25*((pointY/bottomMargin)*(pointY/bottomMargin)))
                player.setMainViewAlpha(alpha: alpha)
            }
        }

        if (sender.state) == .ended
        {
            if(pointY <= (windowHeight*0.7)){
                resizePlayer(isShow: true)
            }else{
                resizePlayer(isShow: false)
            }
            beginPoint = 0
            beginplayerY = 0
        }
    }
}

extension HomeViewController: BATabBarControllerDelegate {
    func tabBarController(_ tabBarController: BATabBarController, didSelect: UIViewController) {
        print("Delegate success!");
    }
}

extension HomeViewController: PlayerMainViewDelegate {
    func didPlayBtnClick() {
        
    }
    
    func didPauseBtnClick() {
        
    }
    
    func didNextBtnClick() {
        
    }
    
    func didLoopBtnClick() {
        
    }
    
    func didBackBtnClick() {
        
    }
    
    func didClosePlayer() {
        print("didClosePlayer success!");
        self.resizePlayer(isShow: false)
    }
    
}

