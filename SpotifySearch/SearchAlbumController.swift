//
//  SearchAlbumController.swift
//  SpotifySearch
//
//  Created by Pierre on 2/14/17.
//  Copyright © 2017 Pierre. All rights reserved.
//

import Foundation

class SearchAlbumController {
    
	static func querySearchTerm(searchTerm: String, completionHandler: @escaping (_ albumArray: [Album]?) -> Void) {
        guard let searchURL = NetworkController.searchAlbums(searchTerm) else { return }
        
        NetworkController.dataAtURL(url: searchURL) { (albumData) in
            guard let albumData = albumData else {
                completionHandler([])
                return
            }
            
            do {
                let albumDictionary = try JSONSerialization.jsonObject(with: albumData, options: .allowFragments)
                
                var albumArray: [Album] = []
                
                if let albumDictionary = albumDictionary as? [String: AnyObject] {
                    if let albums = albumDictionary["albums"] as? [String: AnyObject] {
                        if let items = albums["items"] as? [[String: AnyObject]] {
                            for index in 0..<items.count {
                                let albumName = items[index]
                                
                                guard let array = Album(jsonDictionary: albumName) else { return }
                                albumArray.append(array)
                        	}

                            completionHandler(albumArray)
                        }
                    }
                } else {
                    completionHandler([])
                }
            } catch {
                completionHandler([])
            }
        }
    }

}
