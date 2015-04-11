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

    :param: Type The media type, comforms with MediaType member values.
    :param: Url Contains the media's url.
    :param: Thumb Url Constains the media's thumbnail url when it's available.
*/

struct Media {
    
    var type: MediaType!
    var url: String!
    var thumbUrl: String?
    
    private let manager = SDWebImageManager.sharedManager()
    
    init() {
        self.type = .Image
        self.url = "http://p1.pichost.me/i/65/1900412.jpg"
    }
    
    init(jsonMedia: [String: AnyObject]) {
        self.type = MediaType(rawValue: jsonMedia["type"] as! String)
        self.url = jsonMedia["url"] as! String
        
        if let thumbUrl = jsonMedia["thumb_url"] as? String {
            self.thumbUrl = thumbUrl
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
