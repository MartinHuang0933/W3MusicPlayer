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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = RecommendViewController()
        let vc2 = UIViewController()
        let vc3 = UIViewController()

        let navigationController = UINavigationController(rootViewController: vc1)
        
        let option1 = NSMutableAttributedString(string: "Feed")
        option1.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: option1.length))
        let tabBarItem  = BATabBarItem(image: UIImage(named: "icon1_unselected")!, selectedImage: UIImage(named: "icon1_selected")!, title: option1)
        let tabBarItem2 = BATabBarItem(image: UIImage(named: "icon2_unselected")!, selectedImage: UIImage(named: "icon2_selected")!, title: option1)
        let tabBarItem3 = BATabBarItem(image: UIImage(named: "icon3_unselected")!, selectedImage: UIImage(named: "icon3_selected")!, title: option1)

        baTabBarController.viewControllers = [navigationController, vc2, vc3]
        baTabBarController.tabBarItems = [tabBarItem, tabBarItem2, tabBarItem3]
        baTabBarController.delegate = self
        baTabBarController.tabBarBackgroundColor = #colorLiteral(red: 0.9432541728, green: 0.8550474048, blue: 0.4141118824, alpha: 1)
        
        self.view.addSubview(baTabBarController.view)
    }
}

extension HomeViewController: BATabBarControllerDelegate {
    func tabBarController(_ tabBarController: BATabBarController, didSelect: UIViewController) {
        print("Delegate success!");
    }
}
