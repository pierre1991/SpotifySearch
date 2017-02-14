//
//  AlbumTableViewCell.swift
//  SpotifySearch
//
//  Created by Pierre on 2/14/17.
//  Copyright © 2017 Pierre. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    //MARK: Builder Functions
    func updateAlbumCell(album: Album) {
        albumName.text = album.name
        
        guard let url = album.url else { return }
        
        ImageDownloader.downloadImageFromURL(url: url) { (image) in
            if let image = image {
                DispatchQueue.main.async {
                    self.albumImage.image = image
                }
            }
        }
    }

}
