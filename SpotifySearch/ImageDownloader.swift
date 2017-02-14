//
//  ImageDownloader.swift
//  SpotifySearch
//
//  Created by Pierre on 2/14/17.
//  Copyright © 2017 Pierre. All rights reserved.
//

import Foundation
import UIKit

class ImageDownloader {
    
    static func downloadImageFromURL(url: String, completionHandler: @escaping (UIImage?) -> Void) {
        NetworkController.dataAtURL(url: URL(string: url)!) { (data) in
            guard let data = data else {
                completionHandler(nil)
                return
            }
            
            let image = UIImage(data: data)
            
            completionHandler(image)
        }
    }
    
}
