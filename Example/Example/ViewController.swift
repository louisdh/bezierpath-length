//
//  ViewController.swift
//  Example
//
//  Created by Louis D'hauwe on 18/11/2016.
//  Copyright © 2016 Silver Fox. All rights reserved.
//

import UIKit
import BezierPathLength

class ViewController: UIViewController {

	lazy var paths: [String : UIBezierPath] = {
		
		let rect =  CGRect(x: 0, y: 0, width: 288, height: 288)

		let linePath = UIBezierPath()
		linePath.move(to: CGPoint(x: 100, y: 100))
		linePath.addLine(to: CGPoint(x: 200, y: 250))
		
		let circlePath = UIBezierPath(ovalIn: rect.insetBy(dx: 8.0, dy: 8.0))
		
		let roundedPath = UIBezierPath(roundedRect: rect.insetBy(dx: 8.0, dy: 8.0), cornerRadius: 16.0)
		
		let loopPath = UIBezierPath()

		loopPath.move(to: CGPoint(x: 100, y: 100))
		loopPath.addQuadCurve(to: CGPoint(x: 140, y: 20), controlPoint: CGPoint(x: 150, y: 200))
		loopPath.addQuadCurve(to: CGPoint(x: 240, y: 120), controlPoint: CGPoint(x: 50, y: 300))
		
		
		let starPath = UIBezierPath()
		starPath.move(to: CGPoint(x: 144, y: 17.72))
		starPath.addLine(to: CGPoint(x: 191.52, y: 87.06))
		starPath.addLine(to: CGPoint(x: 272.15, y: 110.83))
		starPath.addLine(to: CGPoint(x: 220.89, y: 177.45))
		starPath.addLine(to: CGPoint(x: 223.2, y: 261.48))
		starPath.addLine(to: CGPoint(x: 144, y: 233.32))
		starPath.addLine(to: CGPoint(x: 64.8, y: 261.48))
		starPath.addLine(to: CGPoint(x: 67.11, y: 177.45))
		starPath.addLine(to: CGPoint(x: 15.85, y: 110.83))
		starPath.addLine(to: CGPoint(x: 96.48, y: 87.06))
		starPath.addLine(to: CGPoint(x: 144, y: 17.72))

		
		let spiralPath = UIBezierPath()
		spiralPath.move(to: CGPoint(x: 253.5, y: 179))
		spiralPath.addCurve(to: CGPoint(x: 131.53, y: 57.4), controlPoint1: CGPoint(x: 253.5, y: 111.88), controlPoint2: CGPoint(x: 198.9, y: 57.4))
		spiralPath.addCurve(to: CGPoint(x: 34, y: 154.68), controlPoint1: CGPoint(x: 77.65, y: 57.4), controlPoint2: CGPoint(x: 34, y: 100.96))
		spiralPath.addCurve(to: CGPoint(x: 112.05, y: 232.5), controlPoint1: CGPoint(x: 34, y: 197.67), controlPoint2: CGPoint(x: 68.94, y: 232.5))
		spiralPath.addCurve(to: CGPoint(x: 174.51, y: 170.23), controlPoint1: CGPoint(x: 146.54, y: 232.5), controlPoint2: CGPoint(x: 174.51, y: 204.62))
		spiralPath.addCurve(to: CGPoint(x: 124.56, y: 120.43), controlPoint1: CGPoint(x: 174.51, y: 142.75), controlPoint2: CGPoint(x: 152.13, y: 120.43))
		spiralPath.addCurve(to: CGPoint(x: 84.62, y: 160.25), controlPoint1: CGPoint(x: 102.49, y: 120.43), controlPoint2: CGPoint(x: 84.62, y: 138.25))
		spiralPath.addCurve(to: CGPoint(x: 116.61, y: 192.14), controlPoint1: CGPoint(x: 84.62, y: 177.85), controlPoint2: CGPoint(x: 98.92, y: 192.14))
		spiralPath.addCurve(to: CGPoint(x: 142.16, y: 166.66), controlPoint1: CGPoint(x: 130.73, y: 192.14), controlPoint2: CGPoint(x: 142.16, y: 180.74))
		spiralPath.addCurve(to: CGPoint(x: 121.7, y: 146.26), controlPoint1: CGPoint(x: 142.16, y: 155.4), controlPoint2: CGPoint(x: 133.01, y: 146.26))
		spiralPath.addCurve(to: CGPoint(x: 105.35, y: 162.57), controlPoint1: CGPoint(x: 112.68, y: 146.26), controlPoint2: CGPoint(x: 105.35, y: 153.57))
		
		
		let infinityPath = UIBezierPath()
		infinityPath.move(to: CGPoint(x: 136.72, y: 145.64))
		infinityPath.addCurve(to: CGPoint(x: 269.5, y: 147.17), controlPoint1: CGPoint(x: 234.75, y: 101.55), controlPoint2: CGPoint(x: 269.5, y: 114.89))
		infinityPath.addCurve(to: CGPoint(x: 140.53, y: 143.56), controlPoint1: CGPoint(x: 269.5, y: 194.23), controlPoint2: CGPoint(x: 172.12, y: 161.79))
		infinityPath.addCurve(to: CGPoint(x: 16.9, y: 147.17), controlPoint1: CGPoint(x: 110.07, y: 125.97), controlPoint2: CGPoint(x: 16.9, y: 95.77))
		infinityPath.addCurve(to: CGPoint(x: 136.72, y: 145.64), controlPoint1: CGPoint(x: 16.9, y: 167.57), controlPoint2: CGPoint(x: 37.72, y: 190.22))


		
		return ["Line" : linePath,
				"Circle" : circlePath,
				"Rounded Rect" : roundedPath,
				"Quadratic Loop" : loopPath,
				"Star" : starPath,
				"Spiral" : spiralPath,
				"Infinity" : infinityPath]
		
	}()
	
	@IBOutlet weak var lengthLbl: UILabel!
	
	@IBOutlet weak var percentageLbl: UILabel!
	@IBOutlet weak var bezierView: BezierView!
	
	@IBOutlet weak var pathPickerBtn: UIButton!
	
	@IBOutlet weak var percentageSlider: UISlider!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		if let (name, path) = paths.first {
		
			pathPickerBtn.setTitle(name, for: .normal)
			
			bezierView.bezierPath = path
			
			update()
			
		}

	}
	
	@IBAction func pickPath(_ sender: UIButton) {
		
		let alertController = UIAlertController(title: "Pick a path", message: nil, preferredStyle: .actionSheet)
		
		for (name, path) in paths {
			
			let action = UIAlertAction(title: name, style: .default, handler: { (action) in
				
				self.pathPickerBtn.setTitle(name, for: .normal)
				self.bezierView.bezierPath = path
				self.update()
				
			})
			
			alertController.addAction(action)
		}
		
		self.present(alertController, animated: true, completion: nil)
		
	}
	
	@IBAction func didChangeSliderValue(_ sender: UISlider) {
		
		update()
	}
	
	fileprivate func update() {
		
		percentageLbl.text = String(format: "%.2f", percentageSlider.value)
		
		if let length = bezierView.bezierPath?.length {
			lengthLbl.text = "\(String(format: "%.2f", length)) pt"
		} else {
			lengthLbl.text = ""
		}
		
		bezierView.focusPercent = CGFloat(percentageSlider.value)
		
	}

}
