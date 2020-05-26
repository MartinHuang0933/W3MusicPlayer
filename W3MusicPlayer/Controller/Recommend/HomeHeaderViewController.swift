//
//  HomeHeaderViewController.swift
//  W3MusicPlayer
//
//  Created by Mac on 2020/5/24.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit

class HomeHeaderViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CommonFunction.sharedInstance.setLabelShadow(label: titleLabel);
        
    }
    
    override func viewWillLayoutSubviews() {
        userBtn.roundedButton()
        userBtn.imageView?.contentMode = .scaleAspectFill
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        userBtn.imageView?.contentMode = .scaleAspectFill
//        userBtn.backgroundColor = .clear
//        userBtn.layer.cornerRadius = 5
//        userBtn.layer.borderWidth = 1
//        userBtn.layer.borderColor = UIColor.black.cgColor
//    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIButton{
    func roundedButton(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
            byRoundingCorners: [.topLeft , .topRight, .bottomLeft, .bottomRight],
            cornerRadii: CGSize(width: 30, height: 30))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}
