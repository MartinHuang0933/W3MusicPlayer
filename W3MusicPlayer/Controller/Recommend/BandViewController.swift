//
//  BandViewController.swift
//  W3MusicPlayer
//
//  Created by Mac on 2020/5/24.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit
import CollectionKit

class BandViewController: CollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 25, bottom: 25, right: 25)
        
        let articles: [BandData] = {
            let albumArray = [
                "MANIC","Changes","Birds Of Prey","Behind the Cover"
            ]
            let singerArray = [
                "Halsey","Justin Bieber","Various","Billie Eilish"
            ]
            
            return (0...albumArray.count-1).map {
                BandData(imageName: albumArray[$0],
                    title: albumArray[$0],
                    subTitle: singerArray[$0],
                    like: false)
            }
        }()
        
        let visibleFrameInsets = UIEdgeInsets(top: 0, left: -100, bottom: 0, right: -100)
        provider = BasicProvider(
            dataSource: articles,
            viewSource: { (view: BandView, data: BandData, at: Int) in
                view.populate(bandData: data)
        },
            sizeSource: { (data, view, size) -> CGSize in
                return CGSize(width: size.width * 0.6, height: 100)
        },
            layout: WaterfallLayout(columns: 1, spacing: 15).transposed().insetVisibleFrame(by: visibleFrameInsets),
            animator: WobbleAnimator()
        )
    }
}
