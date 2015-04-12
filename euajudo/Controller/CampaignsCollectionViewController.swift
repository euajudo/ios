//
//  CampaignsCollectionViewController.swift
//  euajudo
//
//  Created by Rafael Kellermann Streit on 4/11/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit


let kCellCampaignIdentifier = "CellCampaign"


class CampaignsCollectionViewController: UICollectionViewController {

    var campaigns = [Campaign]()
    
    @IBOutlet weak var buttonProfile: UIBarButtonItem!
    @IBOutlet weak var buttonSettings: UIBarButtonItem!
    
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
        API.sharedInstance.allCampaings { (campaignList, error) -> Void in
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
    
    // MARK: - Navigation
    
    func showAuth() {
        let auth = self.storyboard!.instantiateViewControllerWithIdentifier("Auth") as! UINavigationController
        self.presentViewController(auth, animated: true, completion: nil)
    }
    
    
    // MARK: - IBAction
    
    @IBAction func buttonProfilePressed(sender: AnyObject) {
        if !API.sharedInstance.isLogged() {
            showAuth()
        }
    }
    
    @IBAction func buttonSettingsPressed(sender: AnyObject) {
        
    }
    
}


// MARK: UICollectionViewDataSource

extension CampaignsCollectionViewController: UICollectionViewDataSource {
    
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

extension CampaignsCollectionViewController: UICollectionViewDelegate {
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let campaign = campaigns[indexPath.row]
        self.performSegueWithIdentifier("Campaign", sender: campaign)
    }
    
}


// MARK: UICollectionViewDataSource

extension CampaignsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(view.frame.size.width, view.frame.size.width)
    }
    
}
