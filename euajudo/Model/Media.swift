//
//  Media.swift
//  euajudo
//
//  Created by Filipe Alvarenga on 11/04/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import Foundation
import SDWebImage

/**
    Media model.

    :param: type The media type, comforms with MediaType member values.
    :param: url Contains the media's url.
    :param: thumb Url Constains the media's thumbnail url when it's available.
*/

struct Media {
    
    var type: MediaType
    var url: String!
    var videoUrl: String?
    
    private let manager = SDWebImageManager.sharedManager()

    init(dict: [String: AnyObject]) {
        self.type = MediaType(rawValue: dict["type"] as! String)!
        self.url = dict["url"] as! String
        
        if let video = dict["videoUrl"] as? String {
            self.videoUrl = video
        }
    }
    
    func image(downloadFinished: (image: UIImage) -> Void) {
        let urlToDownload = NSURL(string: self.url)
        
        self.manager.downloadImageWithURL(urlToDownload, options: nil, progress: nil) {
            (image :UIImage?, error: NSError?, cacheType: SDImageCacheType, finished: Bool, imageURL: NSURL!) -> Void in
            if let downloadedImage = image {
                downloadFinished(image: downloadedImage)
            } else {
                // TODO: Return a placeholder image when we have one
            }
        }
    }
}
