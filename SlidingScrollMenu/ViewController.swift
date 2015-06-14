//
//  ViewController.swift
//  SlidingScrollMenu
//
//  Created by Tanaka Koichi on 6/12/15.
//  Copyright (c) 2015 Tanaka Koichi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var descriptionButton: UIButton!
    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var amenitiesButton: UIButton!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollBarView: UnderLineView!
    var selectedIndex:Int?
    var scrollHight:CGFloat = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var contents: [Dictionary<String, AnyObject>] = [
            ["key1": "value1", "keya": "valuea"],
            ["key2": "value2", "keyb": "valueb"],
            ["key3": "value3", "keyc": "valuec"]
        ]
        
        self.setDescriptionScrollView(contents)
        
    }
    
    // Make bed scrollView with CustomView
    func setDescriptionScrollView(contents: NSArray) {
        
        for (var i=0; i < contents.count; i++) {
            // get data
            
            // make CustomView instance
            let dcv = UIView(frame: CGRectMake(self.view.frame.width*CGFloat(i),self.view.frame.origin.y,self.view.frame.width,self.scrollHight))
            // set the content to the customView
            if (i==1) {
                dcv.backgroundColor = UIColor.orangeColor()
            } else if (i==2) {
                dcv.backgroundColor = UIColor.blackColor()
            } else {
                dcv.backgroundColor = UIColor.redColor()
            }
            // add the customView to the scrollView
            self.scrollView.addSubview(dcv)
        }
        // set the final scrollView size to the scrollView as contentSize
        self.scrollView.contentSize = CGSizeMake(CGFloat(self.view.bounds.width * CGFloat(contents.count)), self.scrollHight)
    }
    
    // called when menues are clicked. Move the content to the position of the selected menu.
    @IBAction func selectedMenu(sender: AnyObject) {
        // get selected Button
        var selectedButton = sender as! UIButton
        // get which page should be shown
        var page = selectedButton.frame.origin.x / selectedButton.frame.width
        // set content offset to move the content. after that, scrollViewDidScroll would be called.
        self.scrollView.setContentOffset(CGPointMake(self.scrollView.frame.size.width*page, 0.0), animated: true)
    }
    // called when the scrollView is scrolling.
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // get scrollView offset
        var offset: CGPoint = scrollView.contentOffset
        // get the current frame of scrollBar.
        var frame: CGRect = self.scrollBarView.frame
        // since scrollBar is 1/3 size of scrollContent, offset.x should be devided by 3.
        frame.origin.x = offset.x/3
        
        // move to the position of the frame.
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.1)
        self.scrollBarView.frame = frame
        UIView.commitAnimations()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

