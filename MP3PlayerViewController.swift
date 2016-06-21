//
//  MP3PlayerViewController.swift
//  PAFinalOkhamafe
//
//  Created by Iziren Okhamafe on 5/8/16.
//  Copyright © 2016 Mafe. All rights reserved.
//

import UIKit
import AVFoundation

class MP3PlayerViewController: UIViewController {
    
    let model = Mp3PlayerModel.sharedInstance
    var theSong:Song!
    var theArtist:Artist!
    var mp3Player:AVAudioPlayer!
    
    
    @IBOutlet var lblEntireSongDuration: UILabel!
    @IBOutlet var sliderSongTimer: UISlider!
    @IBOutlet var lblArtist: UILabel!
    @IBOutlet var lblSong: UILabel!
    @IBOutlet var imgArtistArt: UIImageView!
    @IBOutlet var lblTimeInSong: UILabel!
    
    @IBOutlet var sliderVolume: UISlider!
    @IBAction func adjustVolume(sender: UISlider) {
        mp3Player.volume = sliderVolume.value
    }
    
   
    
    @IBAction func btnPlay(sender: UIButton) {
        mp3Player.play()
    }
    
    @IBAction func btnPause(sender: UIButton) {
        mp3Player.pause()
    }
    
    @IBAction func btnStop(sender: UIButton) {
        mp3Player.stop()
        
        do {
            
            try mp3Player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("\(theSong.songName)", ofType: "mp3")!))
            
        } catch {
            //catch any errors
        }
    }
    

    @IBAction func sliderSongStatus(sender: UISlider) {
        mp3Player.currentTime = NSTimeInterval(sliderSongTimer.value)
    }
   
    func updatePlayerTime() {
        sliderSongTimer.value = Float(mp3Player.currentTime)
        lblTimeInSong.text = getSongLabelTimer()
        lblEntireSongDuration.text = getMaxDuration()
        
    }
    
    func getMaxDuration() -> String {
        var seconds = 0
        var minutes = 0
        if let time = mp3Player?.duration {
            seconds = Int(time) % 60
            minutes = (Int(time) / 60) % 60
        }
        
        return String(format: "%0.1d:%0.2d",minutes,seconds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblSong.text = theSong.songName
        lblArtist.text = theSong.artist.name
        imgArtistArt.image = theSong.artist.artistAlbumArt
        
        
        self.title = theSong.songName
        
        do {
            
            try mp3Player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("\(theSong.songName)", ofType: "mp3")!))
            mp3Player.play()
            sliderSongTimer.maximumValue = Float(mp3Player.duration)
            
        } catch {
            //Catch exception if mp3Player does not work
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(MP3PlayerViewController.updatePlayerTime), userInfo: nil, repeats: true)
        
    }

    func getSongLabelTimer() -> String {
        var seconds = 0
        var minutes = 0
        if let time = mp3Player?.currentTime {
            seconds = Int(time) % 60
            minutes = (Int(time) / 60) % 60
        }
        return String(format: "%0.2d:%0.2d",minutes,seconds)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


