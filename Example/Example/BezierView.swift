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

//		let path = UIBezierPath()

		
//		path.addCurve(to: CGPoint(x: 250, y: 250), controlPoint1: CGPoint(x: 200, y: 250), controlPoint2: CGPoint(x: 250, y: 200))
		
//		path.addQuadCurve(to: CGPoint(x: 300, y: 300), controlPoint: CGPoint(x: 150, y: 200))
//		let path = UIBezierPath(roundedRect: rect.insetBy(dx: 8.0, dy: 8.0), cornerRadius: 15.0)
		
		
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
