//
//  NetworkController.swift
//  SpotifySearch
//
//  Created by Pierre on 2/14/17.
//  Copyright © 2017 Pierre. All rights reserved.
//

import Foundation

class NetworkController {
    
    // Base URL
    static let searchURL = "https://api.spotify.com/v1/search"
    
    // Target URL
    static func searchAlbums(_ searchTerm: String) -> URL? {
        return URL(string: searchURL + "?q=\(searchTerm)&type=album&limit=10")
    }
    
    
    static func dataAtURL(url: URL, completionHandler: @escaping (_ data: Data?) -> Void) {
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print(error?.localizedDescription ?? "NO DATA RETURNED")
                completionHandler(nil)
                return
            }
            
            completionHandler(data)
        }
        
        dataTask.resume()
    }
    
}
