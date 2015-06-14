//
//  UnderLineView.swift
//  SlidingScrollMenu
//
//  Created by Tanaka Koichi on 6/13/15.
//  Copyright (c) 2015 Tanaka Koichi. All rights reserved.
//

import UIKit

class UnderLineView: UIView {
    
    
    override func awakeFromNib() {
        
        self.setIndicator()
    }
    
    func setIndicator() {

        var indicator = UILabel(frame: CGRectMake((self.frame.width/2)-15, -16, 30, 30))
        indicator.textColor = UIColor.whiteColor()
        indicator.font = UIFont(name: GoogleIconName, size: 32)
        indicator.text = GoogleIcon.ebb8
        self.addSubview(indicator)
        
    }
//     Only override drawRect: if you perform custom drawing.
//     An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        var context: CGContextRef = UIGraphicsGetCurrentContext()
        
        CGContextSetStrokeColorWithColor(context, UIColor.whiteColor().CGColor)
        
        // Draw them with a 2.0 stroke width so they are a bit more visible.
        CGContextSetLineWidth(context, 10.0)
        
        CGContextMoveToPoint(context, 0.0, 0.0); //start at this point
        println(self.frame.width)
        CGContextAddLineToPoint(context, self.frame.width, 0) //draw to this point
        
        // and now draw the Path!
        CGContextStrokePath(context);
    }

    
}
