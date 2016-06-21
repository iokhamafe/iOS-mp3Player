//
//  Artist.swift
//  PAFinalOkhamafe
//
//  Created by Iziren Okhamafe on 4/30/16.
//  Copyright © 2016 Mafe. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class Artist {
    var name:String
    var nationality:String
    var artistBio:String
    var artistAlbumArt:UIImage
    var artistBioArt:UIImage
    var artistAlbums:[Album]
    var artistLocation:CLLocationCoordinate2D
    
    init(name:String, nationality:String, artistBio:String, artistAlbumArt:UIImage, artistBioArt:UIImage,artistAlbum:String, artistLocation:CLLocationCoordinate2D) {
    
        self.name = name
        self.nationality = nationality
        self.artistBio = artistBio
        self.artistAlbumArt = artistAlbumArt
        self.artistBioArt = artistBioArt
        self.artistAlbums = [Album]()
        self.artistLocation = artistLocation
        
    }
    
    func addAlbum(album:Album) {
        artistAlbums.append(album)
    }
}
