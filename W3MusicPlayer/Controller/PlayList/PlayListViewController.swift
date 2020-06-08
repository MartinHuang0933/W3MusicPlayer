//
//  PlayListViewController.swift
//  W3MusicPlayer
//
//  Created by Mac on 2020/5/27.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit
import FluentDarkModeKit

class PlayListViewController: UIViewController {

    @IBOutlet weak var mainTbl: UITableView!
    
    let KScreenWidth = UIScreen.main.bounds.size.width
    let bannerHeight = CGFloat(210)
    let header = PlaylistHeader.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: false)
        let nib = UINib(nibName: "PlayListTableViewCell", bundle: nil)
        self.mainTbl.register(nib, forCellReuseIdentifier: "PlayListTableViewCell")
        let statusHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        self.mainTbl.contentInset = UIEdgeInsets(top: bannerHeight-statusHeight, left: 0, bottom: 0, right: 0)
        
        let headerData = PlayListHeaderData.init(imageName: "autumn-studio-zv3ckJKftC4-unsplash",
                                                 title: "Morning Coffee",
                                                 BannerHeight: bannerHeight)
        header.populate(headerData: headerData)
        self.view.addSubview(header)
    }
}

extension PlayListViewController: UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        64
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayListTableViewCell", for: indexPath) as! PlayListTableViewCell
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        header.layoutChange(scrollView.contentOffset.y)
    }
}
