//
//  Model.swift
//  PAFinalOkhamafe
//
//  Created by Iziren Okhamafe on 4/24/16.
//  Copyright © 2016 Mafe. All rights reserved.
//

import Foundation


class Mp3PlayerModel {
    static let sharedInstance = Mp3PlayerModel()
    
    var albums:[Album]
    var songs:[Song]
    var artists:[Artist]
    
    init() {
        self.albums = [Album]()
        self.songs = [Song]()
        self.artists = [Artist]()
    }
    
    func addAlbum(album:Album) {
        albums.append(album)
    }
    
    func addArtist(artist:Artist) {
        artists.append(artist)
    }
    
    func addSong(songName:Song) {
         songs.append(songName)
    }
        
  }
