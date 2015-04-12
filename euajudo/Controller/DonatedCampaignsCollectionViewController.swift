//
//  DonatedCampaignsCollectionViewController.swift
//  euajudo
//
//  Created by Filipe Alvarenga on 12/04/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit

let reuseIdentifier = "CampaignCell"

class DonatedCampaignsCollectionViewController: UICollectionViewController {
    
    var campaigns = [Campaign]()
    
    lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: "refreshControlUpdateStatus:", forControlEvents: .ValueChanged)
        return refresh
    }()
    
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell in collectionView
        collectionView?.registerNib(UINib(nibName: "CampaignCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: kCellCampaignIdentifier)
        
        // Refresh data
        collectionView?.addSubview(refreshControl)
        reloadCampaigns()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Campaign" {
            if let campaign = sender as? Campaign, controller = segue.destinationViewController as? CampaignDetailViewController {
                controller.campaign = campaign
            }
        }
    }
    
    
    // MARK: Data
    
    func reloadCampaigns() {
        campaigns = [Campaign]()
        refreshControl.beginRefreshing()
        
        unowned let weakSelf = self
        API.sharedInstance.donatedCampaigns { (campaignList, error) -> Void in
            weakSelf.campaigns += campaignList as! [Campaign]
            weakSelf.collectionView!.reloadData()
            weakSelf.refreshControl.endRefreshing()
        }
    }
    
    
    // MARK: RefreshControl
    
    func refreshControlUpdateStatus(refreshControl: UIRefreshControl) {
        if refreshControl.refreshing {
            reloadCampaigns()
        }
    }

}


// MARK: UICollectionViewDataSource

extension DonatedCampaignsCollectionViewController: UICollectionViewDataSource {
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return campaigns.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(kCellCampaignIdentifier, forIndexPath: indexPath) as! CampaignCell
        
        let campaign = campaigns[indexPath.row]
        cell.campaign = campaign
        cell.updateInformations()
        
        return cell
    }
    
}


// MARK: UICollectionViewDelegate

extension DonatedCampaignsCollectionViewController: UICollectionViewDelegate {
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let campaign = campaigns[indexPath.row]
        self.performSegueWithIdentifier("Campaign", sender: campaign)
    }
    
}


// MARK: UICollectionViewDataSource

extension DonatedCampaignsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(view.frame.size.width - 30, 410.0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15.0, left: 15.0, bottom: 15.0, right: 15.0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 20.0
    }
    
}