//
//  RecommendViewController.swift
//  W3MusicPlayer
//
//  Created by Mac on 2020/5/22.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit
import CollectionKit
import FluentDarkModeKit


let bodyInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

func space(_ height: CGFloat) -> SpaceProvider {
    return SpaceProvider(sizeStrategy: (.fill, .absolute(height)))
}

class RecommendViewController: CollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    
        let examples: [(String, UIViewController.Type,CGFloat)] = [
            ("", HomeHeaderViewController.self,100),
            ("For You", BandViewController.self,400),
            ("Listening History", SingerViewController.self,232)
        ]
        
        let examplesSection = BasicProvider(
            dataSource: examples,
            viewSource: { (view: ExampleView, data: (String, UIViewController.Type,CGFloat), at: Int) in
                view.populate(title: data.0, contentViewControllerType: data.1)
        },
            sizeSource: { (index, data, size) -> CGSize in
                return CGSize(width: size.width, height: data.2)
        },
            layout: FlowLayout(lineSpacing: 0).inset(by: bodyInset)
        )
        
        provider = ComposedProvider(sections: [
            examplesSection
        ])
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 54, right: 0)
    }
}
