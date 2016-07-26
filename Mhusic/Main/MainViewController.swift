//
//  MainViewController.swift
//  Mhusic
//
//  Created by Juan David Cruz Serrano on 7/25/16.
//  Copyright © 2016 dhamova. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, SPTAudioStreamingDelegate {
    
    var spotifySession: SPTSession!
    
    var spotifyPlayer: SPTAudioStreamingController!
    
    var userSession: SPTSession!
    
    var currentUser: SPTUser!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        spotifyPlayer = appDelegate.spotifyPlayer;
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getSpotifyUserInformation () {
        
        SPTUser.requestCurrentUserWithAccessToken(userSession.accessToken) { (error, user) in
            if error == nil {
                
                self.currentUser = user as! SPTUser
                
                print("\(self.currentUser)")
                
            } else {
                
                print("Error getting user info")
                
            }
            
        }
        
    }

}
