//
//  CampaignDetailViewController.swift
//  euajudo
//
//  Created by Rafael Kellermann Streit on 4/11/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit

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
        labelReceiverName.text = "nome do usuário"
        labelDescription.text = campaign.description
        
        unowned let weakSelf = self
        campaign.mainMedia.image { (image) -> Void in
            weakSelf.imageView.image = image
        }
        
        createFooterView()
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
        footerViewBackground.alpha = 0.8
        footerView.addSubview(footerViewBackground)
        
        let footerViewButton = UIButton(frame: CGRectMake(15, 15, width - 30, 44))
        footerViewButton.setTitle("DOAR", forState: .Normal)
        footerViewButton.backgroundColor = UIColor.greenColor()
        footerView.addSubview(footerViewButton)
        
        view.addSubview(footerView)
    }
    
    
    // MARK: IBAction

    @IBAction func buttonSharePressed(sender: AnyObject) {
        let objectsToShare = ["Foobar"]
        let activity = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        self.presentViewController(activity, animated: true, completion: nil)
    }
}