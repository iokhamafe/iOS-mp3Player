//
//  TableViewIntroScreen.swift
//  PAFinalOkhamafe
//
//  Created by Lamido Tijjo on 5/1/16.
//  Copyright © 2016 Mafe. All rights reserved.
//


import UIKit

class TableViewIntroScreen: UITableViewController {
    let model = Mp3PlayerModel.sharedInstance
    var selectedSong:Int = 0
    var selectedArtist:Int = 0
    var selectedAlbum:Int = 0
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.orangeColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return model.artists.count
        } else if section == 1 {
            return model.albums.count
        } else if section == 2{
            return model.songs.count
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Artists"
        } else if section == 1 {
            return "Albums"
        } else if section == 2 {
            return "Songs"
        } else {
            return nil
        }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell! = nil
        if indexPath.section == 0 {
        
            
        cell = tableView.dequeueReusableCellWithIdentifier("artistCell", forIndexPath: indexPath)
        
        let currentArtist = model.artists[indexPath.row]
        cell.textLabel?.text = currentArtist.name //set it to display name of Artist
        cell.imageView?.image = currentArtist.artistAlbumArt //set table to show image alongside albumArt
            
        } else if indexPath.section == 1 {
            cell = tableView.dequeueReusableCellWithIdentifier("albumCell", forIndexPath: indexPath)
            let currentAlbum = model.albums[indexPath.row]
            
            cell.textLabel?.text = currentAlbum.albumName //set it to display name of Album
            cell.imageView?.image = currentAlbum.artistName.artistAlbumArt
            
        } else if indexPath.section == 2 {
            cell = tableView.dequeueReusableCellWithIdentifier("songCell", forIndexPath: indexPath)
            let currentSong = model.songs[indexPath.row]
            
            cell.textLabel?.text = currentSong.songName //set it to display name of Song
            cell.imageView?.image = currentSong.artist.artistAlbumArt
        }
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            selectedArtist = indexPath.row
            performSegueWithIdentifier("toArtistTableView", sender: self)
        }
        
        else if indexPath.section == 1 {
            selectedAlbum = indexPath.row
            performSegueWithIdentifier("toAlbumVC", sender: self)
        }
    
        else if indexPath.section == 2 {
            selectedSong = indexPath.row
            performSegueWithIdentifier("toMP3Player", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let theSelectedSong:Song = model.songs[selectedSong]
        let theSelectedArtist:Artist = model.artists[selectedArtist]
        
        if segue.identifier == "toMP3Player" {
            let mp3PlayerSegue = segue.destinationViewController as!MP3PlayerViewController
            mp3PlayerSegue.theSong = theSelectedSong
        }
            
        else if segue.identifier == "toAlbumVC" {
            let theSelectedAlbum:Album = model.albums[selectedAlbum]
            
            let albumSegue = segue.destinationViewController as! AlbumTableViewController
            albumSegue.theAlbum = theSelectedAlbum
        }
        
        else if segue.identifier == "toArtistTableView" {
            
            let artistSegue = segue.destinationViewController as!ArtistsTableViewController
            artistSegue.theArtist = theSelectedArtist
        }
        
    }


    
}
