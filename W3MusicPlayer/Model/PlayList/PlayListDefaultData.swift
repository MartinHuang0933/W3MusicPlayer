//
//  PlayListDefalttData.swift
//  W3MusicPlayer
//
//  Created by Mac on 2020/6/8.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit

class PlayListDefaultData: NSObject {
    
    struct Row {
        var album: String
        var singer: String
        var time: String
        var like: Bool
        var play: Bool
    }
    
    static let cell20 : [PlayListCellData] = {
        let albumArray = [
            "Sour Candy","Rain On Me","Stuck with U","Lose Somebody","Señorita",
            "Together","Broken Glass","Be Kind","Higher Ground","Summer Feelings"
        ]
        let singerArray = [
            "Lady Gaga, BLACKPINK","Lady Gaga, Ariana Grande","Ariana Grande, Justin Bieber","Kygo, OneRepublic","Shawn Mendes, Camila Cabello",
            "Sia","Kygo, Kim Petras","Marshmello, Halsey","Martin Garrix, John Martin","Lennon Stella, Charlie Puth"
        ]
        let timeArray = [
            "2:38","3:04","3:50","3:20","3:26",
            "3:29","4:28","3:16","3:27","2:41"
        ]
        
        let likeArray = [
            true,false,true,false,true,true,
            false,false,true,false,true,false
        ]
        
        let playArray = [
            false,false,true,false,false,false,
            false,false,false,false,false,false
        ]
        
        return (0...albumArray.count-1).map {
            PlayListCellData(title:albumArray[$0],
                             subTitle: singerArray[$0],
                             like: likeArray[$0],
                             time: timeArray[$0],
                             isPlaying: playArray[$0])
        }
    }()
}

