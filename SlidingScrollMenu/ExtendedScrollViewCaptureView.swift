//
//  ExtendedScrollViewCaptureView.swift
//  SlidingScrollMenu
//
//  Created by Tanaka Koichi on 6/12/15.
//  Copyright (c) 2015 Tanaka Koichi. All rights reserved.
//

import UIKit

class ExtendedScrollViewCaptureView: UIView {

    
    var scrollView: UIScrollView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func hitTest(point:CGPoint, event:UIEvent) -> UIImage? {
//        if (self.pointInside(point, withEvent: event)){
//            return self.scrollView
//        }
//        return nil
//    }
}
