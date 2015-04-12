//
//  CampaignDetailViewController.swift
//  euajudo
//
//  Created by Rafael Kellermann Streit on 4/11/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit
import XCDYouTubeKit
import MMMarkdown

let footerViewHeight: CGFloat = 74

class CampaignDetailViewController: UIViewController {
    
    var campaign: Campaign!

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelReceiverName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    var footerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTitle.text = campaign.name
        labelReceiverName.text = campaign.user["name"]
        labelDescription.text = campaign.description
        
        unowned let weakSelf = self
        campaign.mainMedia.image { (image) -> Void in
            weakSelf.imageView.image = image
        }
        
        createFooterView()
        
        // Add tap to imageView
        let tapImageViewGesture = UITapGestureRecognizer(target: self, action: "imageViewPressed:")
        imageView.addGestureRecognizer(tapImageViewGesture)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.scrollView.contentSize = self.contentView.frame.size
    }
    
    // MARK: FooterView
    
    func createFooterView() {
        let frame = self.view.frame
        let top = frame.size.height - footerViewHeight
        let width = frame.size.width
        
        footerView = UIView(frame: CGRectMake(0, top, frame.size.width, footerViewHeight))
        footerView.backgroundColor = UIColor.clearColor()

        let footerViewBackground = UIView(frame: CGRectMake(0, 0, width, footerViewHeight))
        footerViewBackground.backgroundColor = UIColor.whiteColor()
        footerViewBackground.alpha = 0.9
        footerView.addSubview(footerViewBackground)
        
        let footerViewSeparator = UIView(frame: CGRectMake(0, 0, width, 0.5))
        footerViewSeparator.backgroundColor = UIColor.lightGrayColor()
        footerViewSeparator.alpha = 0.5
        footerView.addSubview(footerViewSeparator)
        
        let footerViewButton = UIButton(frame: CGRectMake(15, 15, width - 30, 44))
        footerViewButton.layer.cornerRadius = 5
        footerViewButton.setTitle("AJUDAR CAMPANHA", forState: .Normal)
        footerViewButton.backgroundColor = UIColor(red: 0, green: 178.0/255, blue: 0, alpha: 1)
        footerViewButton.titleLabel?.font = UIFont(name: "Lato-Bold", size: 16)
        footerViewButton.addTarget(self, action: "buttonDonatePressed:", forControlEvents: .TouchUpInside)
        footerView.addSubview(footerViewButton)
        
        view.addSubview(footerView)
    }
    
    
    // MARK: IBAction

    @IBAction func buttonSharePressed(sender: AnyObject) {
        let objectsToShare = [campaign.url]
        let activity = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        self.presentViewController(activity, animated: true, completion: nil)
    }
    
    func imageViewPressed(sender: AnyObject) {
        if campaign.mainMedia.videoUrl == nil {
            return
        }
        
        let movie = XCDYouTubeVideoPlayerViewController(videoIdentifier: campaign.mainMedia.videoUrl)
        self.presentMoviePlayerViewControllerAnimated(movie)
    }
    
    func buttonDonatePressed(sender: AnyObject) {
        let nav = storyboard?.instantiateViewControllerWithIdentifier("Donate") as! UINavigationController

        if let controller = nav.viewControllers[0] as? DonateViewController {
            controller.campaign = campaign

            nav.modalPresentationStyle = .FormSheet
            self.presentViewController(nav, animated: true, completion: nil)
        }
    }
}