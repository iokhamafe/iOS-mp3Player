//
//  ArtistsTableViewController.swift
//  PAFinalOkhamafe
//
//  Created by Lamido Tijjo on 5/8/16.
//  Copyright © 2016 Mafe. All rights reserved.
//

import UIKit

class ArtistsTableViewController: UITableViewController {
    
    let model = Mp3PlayerModel.sharedInstance
    var theArtist:Artist!
    var selectedRow:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = theArtist.name
        view.backgroundColor = UIColor.orangeColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 1
        } else {
            return 1
        }
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Albums"
        } else if section == 1 {
            return "Artist Bio"
        } else {
            return nil
        }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell! = nil
        
        
        if indexPath.section == 0 {
            
            cell = tableView.dequeueReusableCellWithIdentifier("albumCell", forIndexPath: indexPath)
            cell.textLabel?.text = theArtist.artistAlbums[indexPath.row].albumName
            cell.imageView?.image = theArtist.artistAlbumArt
            
        } else if indexPath.section == 1 {
            cell = tableView.dequeueReusableCellWithIdentifier("artistBioCell", forIndexPath: indexPath)
            cell.textLabel?.text = "Artist Biography"
            
            
        }         
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            selectedRow = indexPath.row
            performSegueWithIdentifier("toAlbumVCagain", sender: self)
        } else if indexPath.section == 1 {
            selectedRow = indexPath.row
            performSegueWithIdentifier("toBiography", sender: self)
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toAlbumVCagain" {
            
            let selectedAlbum:Album = theArtist.artistAlbums[selectedRow]
            let nextController = segue.destinationViewController as! AlbumTableViewController
            nextController.theAlbum = selectedAlbum
            
        } else if segue.identifier == "toBiography" {
            let selectedArtist:Artist = theArtist
            let nextController = segue.destinationViewController as! ArtistBioViewController
            nextController.theArtist = selectedArtist
        }
    }
}