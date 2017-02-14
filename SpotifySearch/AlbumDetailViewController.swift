//
//  AlbumDetailViewController.swift
//  SpotifySearch
//
//  Created by Pierre on 2/14/17.
//  Copyright © 2017 Pierre. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController {

    //MARK: Properties
    var album: Album?
    
    
    //MARK: IBOutlets
    @IBOutlet weak var albumArtwork: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let album = album, let url = album.url else { return }
        
        albumName.text = album.name
        
        ImageDownloader.downloadImageFromURL(url: url) { (image) in
            if let image = image {
                DispatchQueue.main.async {
                    self.albumArtwork.image = image
                }
            }
        }
    }

}
