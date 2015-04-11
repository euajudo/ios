//
//  CampaignDetailViewController.swift
//  euajudo
//
//  Created by Rafael Kellermann Streit on 4/11/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit


class CampaignDetailViewController: UIViewController {
    
    var campaign: Campaign?

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelReceiverName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTitle.text = "Lorem ipsum Deserunt adipisicing ad irure dolor in qui laborum Duis minim culpa velit ex sed dolore."
        
        labelReceiverName.text = "Lorem ipsum Deserunt adipisicing ad irure dolor in qui laborum Duis minim culpa velit ex sed dolore."
        
        labelDescription.text = "Lorem ipsum In nostrud sit fugiat ut ullamco nisi id in elit aliquip commodo veniam velit proident anim elit in labore mollit voluptate incididunt non velit voluptate irure cillum officia cillum ad irure elit reprehenderit sed adipisicing irure eiusmod in nostrud aliquip proident ea consectetur consequat aliquip Excepteur in qui in labore cupidatat laborum aliquip non laborum aute exercitation exercitation occaecat ut aliqua et non Ut est incididunt magna dolore adipisicing Excepteur fugiat laborum dolore dolor Excepteur dolore dolore quis laborum tempor quis Excepteur officia quis consectetur adipisicing quis laboris mollit in sunt anim magna ullamco Excepteur non sit reprehenderit ut anim cupidatat commodo do do non magna eiusmod incididunt laboris sint sit in incididunt minim nostrud eiusmod qui in exercitation dolore irure Duis velit aliqua dolore in amet veniam mollit minim enim dolor voluptate occaecat pariatur dolor est commodo in do nisi esse in aute Excepteur laborum do esse culpa laborum nulla aute nulla anim ex in nisi amet enim aute.\n\nLorem ipsum In nostrud sit fugiat ut ullamco nisi id in elit aliquip commodo veniam velit proident anim elit in labore mollit voluptate incididunt non velit voluptate irure cillum officia cillum ad irure elit reprehenderit sed adipisicing irure eiusmod in nostrud aliquip proident ea consectetur consequat aliquip Excepteur in qui in labore cupidatat laborum aliquip non laborum aute exercitation exercitation occaecat ut aliqua et non Ut est incididunt magna dolore adipisicing Excepteur fugiat laborum dolore dolor Excepteur dolore dolore quis laborum tempor quis Excepteur officia quis consectetur adipisicing quis laboris mollit in sunt anim magna ullamco Excepteur non sit reprehenderit ut anim cupidatat commodo do do non magna eiusmod incididunt laboris sint sit in incididunt minim nostrud eiusmod qui in exercitation dolore irure Duis velit aliqua dolore in amet veniam mollit minim enim dolor voluptate occaecat pariatur dolor est commodo in do nisi esse in aute Excepteur laborum do esse culpa laborum nulla aute nulla anim ex in nisi amet enim aute.\n\nLorem ipsum In nostrud sit fugiat ut ullamco nisi id in elit aliquip commodo veniam velit proident anim elit in labore mollit voluptate incididunt non velit voluptate irure cillum officia cillum ad irure elit reprehenderit sed adipisicing irure eiusmod in nostrud aliquip proident ea consectetur consequat aliquip Excepteur in qui in labore cupidatat laborum aliquip non laborum aute exercitation exercitation occaecat ut aliqua et non Ut est incididunt magna dolore adipisicing Excepteur fugiat laborum dolore dolor Excepteur dolore dolore quis laborum tempor quis Excepteur officia quis consectetur adipisicing quis laboris mollit in sunt anim magna ullamco Excepteur non sit reprehenderit ut anim cupidatat commodo do do non magna eiusmod incididunt laboris sint sit in incididunt minim nostrud eiusmod qui in exercitation dolore irure Duis velit aliqua dolore in amet veniam mollit minim enim dolor voluptate occaecat pariatur dolor est commodo in do nisi esse in aute Excepteur laborum do esse culpa laborum nulla aute nulla anim ex in nisi amet enim aute."
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.scrollView.contentSize = self.contentView.frame.size
    }
    
    
    // MARK: IBAction

    @IBAction func buttonSharePressed(sender: AnyObject) {
        let objectsToShare = ["Foobar"]
        let activity = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        self.presentViewController(activity, animated: true, completion: nil)
    }
}