//
//  ViewController.swift
//  PAFinalOkhamafe
//
//  Created by Lamido Tijjo on 4/24/16.
//  Copyright © 2016 Mafe. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet var graphMusicImage: UIImageView!
    var timer = NSTimer()
    var counter = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: (#selector(self.doAnimation)), userInfo: nil, repeats: true)
        let model = Mp3PlayerModel.sharedInstance
        
        let artist1 = Artist(name: "Koudede", nationality: "Nigerien", artistBio: "Born in Agadez, Niger, Koudede grew up in Arlit, between the foothills of the massif of Aïr and the sands of the Sahara, in the dust of the uranium mines… He made his first guitar from a tin can, and as soon as he could get hold of a real one, already had a sufficiently developed technique to accompany musicians such as Abdallah Oumbadougou (Takrist 'n' Akal). After spending time in Algeria and Libya, he migrated to Agadez, the Touareg capital, and in typical nomad fashion started to travel around the Sahel region, following the calendar of family celebrations and community festivals. He played for a time with other Touareg musicians before finding his wings and composing his own original songs. He came to the notice of the public for the first time at the 'Cure Salée' festival (translated to: 'salt cure'), where his 'rhythm' – in other words his skill at making people dance – was much remarked upon.", artistAlbumArt: UIImage(named: "koudede.jpg")!, artistBioArt: UIImage(named: "koudedetwo.jpg")!, artistAlbum: "Alam'i", artistLocation: CLLocationCoordinate2D(latitude: 18.74, longitude: 7.37))
        let artist2 = Artist(name: "Tears for Fears", nationality: "British", artistBio: "Tears for Fears are an English pop/rock band formed in 1981 by Roland Orzabal and Curt Smith. Founded after the dissolution of their first band, the mod-influenced Graduate, they were initially associated with the new wave synthesizer bands of the early 1980s but later branched out into mainstream rock and pop, which led to international chart success. They were part of the MTV-driven Second British Invasion of the US. Their platinum-selling debut album, The Hurting, reached number one on the UK Albums Chart, while their second album, Songs from the Big Chair, reached number one on the US Billboard 200, achieving multi-platinum status in both the UK and the US.", artistAlbumArt: UIImage(named: "tears-for-fears.jpg")!, artistBioArt: UIImage(named: "TearsForFearsTwo.jpg")!, artistAlbum: "Songs from the Big Chair", artistLocation: CLLocationCoordinate2D(latitude: 51.38, longitude: -2.40))
        let artist3 = Artist(name: "Kodomo Band", nationality: "Japanese", artistBio: "Active from 1979 to present day, the Kodomo band is comprised of 4 members known for their breathtaking albums they produced in the 80s for the Hokuto no Ken anime franchise.", artistAlbumArt: UIImage(named: "komodoband.jpg")!, artistBioArt: UIImage(named: "kodomobandtwo.jpg")!, artistAlbum: "Heart of Madness", artistLocation: CLLocationCoordinate2D(latitude: 35.67, longitude: 139.57))
        let artist4 = Artist(name: "Meatloaf", nationality: "American", artistBio: "Michael Lee Aday (born Marvin Lee Aday, September 27, 1947) is an American musician, singer, songwriter, record producer and actor usually known by his stage name Meat Loaf. He is noted for the Bat Out of Hell trilogy of albums, consisting of Bat Out of Hell, Bat Out of Hell II: Back into Hell, and Bat Out of Hell III: The Monster is Loose. Bat Out of Hell has sold more than 43 million copies worldwide. Almost 40 years after its release, it still sells an estimated 200,000 copies annually, and stayed on the charts for over nine years, making it one of the best selling albums of all time. He is also known for his powerful wide-ranging operatic voice and theatrical live performances. After he enjoyed success with Bat Out of Hell and Bat Out of Hell II: Back Into Hell and earned a Grammy Award for Best Solo Rock Vocal Performance for the song I'd Do Anything for Love, Meat Loaf experienced some initial difficulty establishing a steady career within the United States. However, he has retained iconic status and popularity in Europe, especially the United Kingdom where he received the 1994 Brit Award for Best selling album and single, appeared in the 1997 film Spice World, and ranks 23rd for the number of weeks spent on the UK charts as of 2006. He ranked 96th on VH1's 100 Greatest Artists of Hard Rock.", artistAlbumArt: UIImage(named: "meatloaf.jpg")!, artistBioArt: UIImage(named: "meatloaftwo.jpg")!, artistAlbum: "Bat Out of Hell II: Back into Hell", artistLocation: CLLocationCoordinate2D(latitude: 32.82, longitude: -97.01))
        let song1 = Song(songName: "Koudede - Gandefabou", artist: artist1)
        let song2 = Song(songName: "Koudede - Souvenir nam adjosa", artist: artist1)
        let song3 = Song(songName: "Tears for Fears - Shout", artist: artist2)
        let song4 = Song(songName: "Tears for Fears - Head Over Heels", artist: artist2)
        let song5 = Song(songName: "Komodo Band - Heart of Madness", artist: artist3)
        let song6 = Song(songName: "Komodo Band - Purple Eyes", artist: artist3)
        let song7 = Song(songName: "Meat Loaf - I'd Do Anything For Love (But I Won't Do That) - Album version", artist: artist4)
        let song8 = Song(songName: "Meat Loaf - Life is a Lemon (and I want my Money back)", artist: artist4)
        
        let album1 = Album(albumName: "Alam'i", artistName: artist1, albumYear: "2010", genre: "Ishumar")
        let album2 = Album(albumName: "Songs from the Big Chair", artistName: artist2, albumYear: "1985", genre: "Euro-pop")
        let album3 = Album(albumName: "Heart of Madness", artistName: artist3, albumYear: "1986", genre: "Japanese pop")
        let album4 = Album(albumName: "Bat Out of Hell II: Back into Hell", artistName: artist4, albumYear: "1993", genre: "American Rock")
        
        album1.addSong(song1)
        album1.addSong(song2)
        album2.addSong(song3)
        album2.addSong(song4)
        album3.addSong(song5)
        album3.addSong(song6)
        album4.addSong(song7)
        album4.addSong(song8)
        model.addSong(song1)
        model.addSong(song2)
        model.addSong(song3)
        model.addSong(song4)
        model.addSong(song5)
        model.addSong(song6)
        model.addSong(song7)
        model.addSong(song8)
        artist1.addAlbum(album1)
        artist2.addAlbum(album2)
        artist3.addAlbum(album3)
        artist4.addAlbum(album4)
        model.addAlbum(album1)
        model.addAlbum(album2)
        model.addAlbum(album3)
        model.addAlbum(album4)
        model.addArtist(artist1)
        model.addArtist(artist2)
        model.addArtist(artist3)
        model.addArtist(artist4)
            
            
    }
    
    func doAnimation() {
        if counter == 16 {
            counter = 1
        } else {
            counter += 1
        }
        graphMusicImage.image = UIImage(named: "frame\(counter).png")
        
    }
}

