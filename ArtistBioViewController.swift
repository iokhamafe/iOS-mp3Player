//
//  ArtistBioViewController.swift
//  PAFinalOkhamafe
//
//  Created by Lamido Tijjo on 5/16/16.
//  Copyright © 2016 Mafe. All rights reserved.
//

import UIKit
import MapKit

class ArtistBioViewController: UIViewController {
    
    var theArtist:Artist!

    
    
    @IBOutlet var artistBioBox: UITextView!
    
    @IBOutlet var artistBioImage: UIImageView!
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = theArtist.name
        view.backgroundColor = UIColor.orangeColor()
        self.artistBioBox.backgroundColor = UIColor.orangeColor()
        self.artistBioBox.text = theArtist.artistBio
        self.artistBioImage.image = theArtist.artistBioArt
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.artistBioBox.setContentOffset(CGPointZero, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toArtistLocation" {
            let selectedArtist:Artist = theArtist
            let nextController = segue.destinationViewController as! ArtistLocationViewController
            nextController.theArtist = selectedArtist
        }
    }
    

}
