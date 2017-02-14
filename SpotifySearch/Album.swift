//
//  Album.swift
//  SpotifySearch
//
//  Created by Pierre on 2/14/17.
//  Copyright © 2017 Pierre. All rights reserved.
//

import Foundation

class Album {

    private let kImages = "images"
    private let kUrl = "url"
    private let kName = "name"

    var name: String?
    var url: String?

    init?(jsonDictionary: [String: AnyObject]) {
        guard let name = jsonDictionary[kName] as? String else { return }
        self.name = name
        
        if let images = jsonDictionary[kImages] as? [[String: AnyObject]] {
            if let url = images[2][kUrl] as? String {
                self.url = url
            }
        }
    }
    
}


/*
 Using the Spotify public API, create an app which allows a user to search for albums, and then save them to a collection. Among the things the app should do:
 
 
 
 •	Allow the user to search by album name
 
 •	Display ~10 albums, with cover art and album name
 
 •	Allow the user to add an album to their collection by some standard gesture
 
 •	Keep the list of saved albums locally so that if the app is killed, that list is not lost (you do not have to display the saved list at this point, just keep track of it)
 
 •	Album layout should look good in portrait and landscape
 
 
 
 You may use Swift or Objective-C. Please include unit tests for components where appropriate. Also, code in such a way that you will be able to easily add functionality later.
*/
