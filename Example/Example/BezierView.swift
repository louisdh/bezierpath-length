//
//  BezierView.swift
//  Example
//
//  Created by Louis D'hauwe on 19/11/2016.
//  Copyright © 2016 Silver Fox. All rights reserved.
//

import UIKit
import BezierPathLength

class BezierView: UIView {

	var bezierPath: UIBezierPath? {
		didSet {
			self.setNeedsDisplay()
		}
	}
	
	var focusPercent: CGFloat? {
		didSet {
			self.setNeedsDisplay()
		}
	}
	
    override func draw(_ rect: CGRect) {
			
		guard let path = bezierPath else {
			return
		}
		
		path.lineWidth = 4.0
		path.lineCapStyle = .round
		path.lineJoinStyle = .round
		
		UIColor.red.setStroke()
		
		path.stroke()
		
		if let focusPercent = focusPercent {
			
			if let p = path.point(at: focusPercent) {
			
				let focusSize: CGFloat = 12.0
				
				let ovalRect = CGRect(x: p.x - focusSize/2.0, y: p.y - focusSize/2.0, width: focusSize, height: focusSize)
				let focusPointPath = UIBezierPath(ovalIn: ovalRect)
				UIColor.blue.setFill()
				focusPointPath.fill()
				
			}
			
		}
		
    }

}
