//
//  Song.swift
//  PAFinalOkhamafe
//
//  Created by Iziren Okhamafe on 4/30/16.
//  Copyright © 2016 Mafe. All rights reserved.
//

import Foundation

class Song {
    var songName:String
    var artist:Artist
    //var song:mp3 somehow
    
    init(songName:String, artist:Artist) {
        self.songName = songName
        self.artist = artist
    }
}
