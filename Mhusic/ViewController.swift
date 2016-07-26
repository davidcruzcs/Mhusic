//
//  ViewController.swift
//  Mhusic
//
//  Created by Juan David Cruz Serrano on 7/16/16.
//  Copyright © 2016 dhamova. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SPTAudioStreamingDelegate {
    
  override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginWithSpotify(sender: AnyObject) {
        
        let urlSpotifyLogin = SPTAuth.defaultInstance().loginURL

        UIApplication.sharedApplication().performSelector(#selector(UIApplication.openURL(_:)), withObject: urlSpotifyLogin, afterDelay: 0.1)
    }
    
    func audioStreamingDidLogin(audioStreaming: SPTAudioStreamingController!) {
        
        let urlSong = NSURL(string: "spotify:user:juancruzs:playlist:0k3Imke9lj2d04sGci9Vlq")
        
        self.spotifyPlayer.playURIs([urlSong!], withOptions: SPTPlayOptions.init()) { (error) in
            if error == nil {
                
                self.getSpotifyUserInformation()
                
            } else {
                print("Error Playing: \(error)")
            }
        }
        
        
    }

}

