//
//  CampaignsCollectionViewController.swift
//  euajudo
//
//  Created by Rafael Kellermann Streit on 4/11/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit

class CampaignsCollectionViewController: UICollectionViewController {

    var campaigns = [Campaign]()
    
    lazy var refreshControl: UIRefreshControl = {
        return UIRefreshControl()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.addSubview(refreshControl)
        reloadCampaigns()
    }
    
    func reloadCampaigns() {
        refreshControl.beginRefreshing()
        
        unowned let weakSelf = self
        API.sharedInstance.allCampaings { (campaignList, error) -> Void in
            weakSelf.campaigns += campaignList as! [Campaign]
            weakSelf.collectionView!.reloadData()
            weakSelf.refreshControl.endRefreshing()
        }
    }
    
}


// MARK: UICollectionViewDataSource

extension CampaignsCollectionViewController: UICollectionViewDataSource {
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return campaigns.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}