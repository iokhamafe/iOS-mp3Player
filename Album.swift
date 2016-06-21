//
//  Album.swift
//  PAFinalOkhamafe
//
//  Created by Iziren Okhamafe on 4/24/16.
//  Copyright © 2016 Mafe. All rights reserved.
//

import Foundation
import UIKit

class Album {
    var songs:[Song]
    
    var artistName:Artist
    var albumName:String 
    var albumYear:String
    var genre: String
    
    
    init(albumName:String, artistName:Artist, albumYear:String, genre:String) {
       
        self.albumName = albumName
        self.artistName = artistName
        self.albumYear = albumYear
        self.genre = genre
        self.songs = [Song]()
    }
    
    //Begin calculation properties section
    
    var numOfSongs:Int {
        get {
            return songs.count
        }
    }
    
    var songNames:[String] {
        var songNames = [String]()
        for n in songs {
            songNames.append(n.songName)
        }
        return songNames
    }
    
    func addSong(songName:Song) {
        songs.append(songName)
    }
    
    
}
