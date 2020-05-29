//
//  SingerViewController.swift
//  W3MusicPlayer
//
//  Created by Mac on 2020/5/26.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit
import CollectionKit
import ViewAnimator

class SingerViewController: CollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .clear
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 25, bottom: 50, right: 25)
        
        let articles: [SingerData] = {
            let nameArray = [
                "Ariana Grande","Billie Eilish","Dua Lipa","Shawn Mendes","Camila Cabello",
                "Harry Styles","Rihanna","Taylor Swift","Selena Gomez","Lady Gaga"
            ]
            
            return (0...nameArray.count-1).map {
                SingerData(imageName: nameArray[$0], title: nameArray[$0])
            }
        }()
        
        let visibleFrameInsets = UIEdgeInsets(top: 0, left: -100, bottom: 0, right: -100)
        provider = BasicProvider(
            dataSource: articles,
            viewSource: { (view: SingerView, data: SingerData, at: Int) in
                view.populate(singerData: data)
        },
            sizeSource: { (_, view, size) -> CGSize in
                return CGSize(width: 115, height: size.width)
        },
            layout: WaterfallLayout(columns: 1, spacing: 15).transposed().insetVisibleFrame(by: visibleFrameInsets),
            animator: WobbleAnimator()
        )
    }
}
