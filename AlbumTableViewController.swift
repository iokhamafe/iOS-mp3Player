//
//  AlbumTableViewController.swift
//  PAFinalOkhamafe
//
//  Created by Iziren Okhamafe on 5/8/16.
//  Copyright © 2016 Mafe. All rights reserved.
//

import UIKit

class AlbumTableViewController: UITableViewController {
    
    var theAlbum:Album!
    var selectedSong:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = theAlbum.albumName
        view.backgroundColor = UIColor.orangeColor()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return theAlbum.numOfSongs
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Songs"
        } else {
            return nil
        }
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("songCell", forIndexPath: indexPath)
        let currentSong = theAlbum.songs[indexPath.row]
        cell.textLabel?.text = currentSong.songName
        cell.imageView?.image = currentSong.artist.artistAlbumArt
        

        return cell
    }
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 0 {
            selectedSong = indexPath.row
            performSegueWithIdentifier("toAudioPlayer", sender: self)
        }
        
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let theSelectedSong = theAlbum.songs[selectedSong]
        if segue.identifier == "toAudioPlayer" {
            let audioPlayerSegue = segue.destinationViewController as! MP3PlayerViewController
            audioPlayerSegue.theSong = theSelectedSong
        }
    
    }
    

}
