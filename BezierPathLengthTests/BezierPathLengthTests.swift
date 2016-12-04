//
//  BezierPathLengthTests.swift
//  BezierPathLengthTests
//
//  Created by Louis D'hauwe on 18/11/2016.
//  Copyright © 2016 Silver Fox. All rights reserved.
//

import XCTest
@testable import BezierPathLength

class BezierPathLengthTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
	func testLinearDistance() {
		
		let a = CGPoint(x: 1, y: 1)
		let b = CGPoint(x: 4, y: 5)
		
		let distance = a.distance(to: b)
		
		assert(distance == 5.0, "Distance was incorrect")
	}
	
	func testSubpath() {

		let path = UIBezierPath()
		path.move(to: .zero)
		path.addLine(to: CGPoint(x: 100, y: 0))
		path.addLine(to: CGPoint(x: 100, y: 100))
		path.addLine(to: CGPoint(x: 0, y: 100))
		path.close()
		path.move(to: CGPoint(x: 100, y: 100))
		path.addLine(to: CGPoint(x: 200, y: 100))
		path.addLine(to: CGPoint(x: 200, y: 200))
		path.addLine(to: CGPoint(x: 100, y: 200))
		path.close()

		let length = path.length
		
		assert(length == 800.0, "Length was incorrect")
		
		let halfPoint = path.point(at: 0.5)
		
		let expectedPoint = CGPoint(x: 0, y: 0)
		
		assert(halfPoint == expectedPoint, "Point was incorrect")

	}
	
	func testSubpathEndPoint() {
		
		let path = UIBezierPath()
		path.move(to: .zero)
		path.addLine(to: CGPoint(x: 100, y: 0))
		path.addLine(to: CGPoint(x: 100, y: 100))
		path.addLine(to: CGPoint(x: 0, y: 100))
		path.close()
		path.move(to: CGPoint(x: 100, y: 100))
		path.addLine(to: CGPoint(x: 200, y: 100))
		path.addLine(to: CGPoint(x: 200, y: 200))
		path.addLine(to: CGPoint(x: 100, y: 200))
		path.close()
		
		let halfPoint = path.point(at: 1.0)
		
		let expectedPoint = CGPoint(x: 100, y: 100)
		
		assert(halfPoint == expectedPoint, "Point was incorrect")
		
	}
	
	func testInvalidPath() {
		
		let path = UIBezierPath()
		path.addLine(to: CGPoint(x: 100, y: 0))

		let length = path.length
		
		assert(length == 0.0, "Length was incorrect")
		
		let point = path.point(at: 0.0)

		assert(point == nil, "Point was incorrect")

	}
	
	func testInvalidPoint() {
		
		let rect = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
		let path = UIBezierPath(rect: rect)
		
		let point = path.point(at: -1.0)
		
		assert(point == nil, "Point was incorrect")
		
	}
	
	func testRectangle() {
		
		let rect = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
		let path = UIBezierPath(rect: rect)
		let cgPath = path.cgPath

		assert(path.length == cgPath.length, "Length was incorrect")

		let length = path.length
		
		assert(length == 400.0, "Length was incorrect")
		
		let halfPoint = path.point(at: 0.5)
		
		assert(halfPoint == cgPath.point(at: 0.5), "Point was incorrect")

		let expectedPoint = CGPoint(x: 100, y: 100)

		assert(halfPoint == expectedPoint, "Point was incorrect")

	}
	
	func testCirlce() {
		
		let rect = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
		let path = UIBezierPath(ovalIn: rect)
		let cgPath = path.cgPath
		
		assert(path.length == cgPath.length, "Length was incorrect")
		
		let length = path.length
		
		assert(length == 314.20010500714841, "Length was incorrect")

		let halfPoint = path.point(at: 0.5)
		
		assert(halfPoint == cgPath.point(at: 0.5), "Point was incorrect")
		
		let expectedPoint = CGPoint(x: 0.0000000000000000000000000000087922669965178421, y: 49.999999999999972)

		assert(halfPoint == expectedPoint, "Point was incorrect")

	}

	func testLoop() {
		
		let loopPath = UIBezierPath()
		
		loopPath.move(to: CGPoint(x: 100, y: 100))
		loopPath.addQuadCurve(to: CGPoint(x: 140, y: 20), controlPoint: CGPoint(x: 150, y: 200))
		loopPath.addQuadCurve(to: CGPoint(x: 240, y: 120), controlPoint: CGPoint(x: 50, y: 300))
		
		
		let cgPath = loopPath.cgPath
		
		assert(loopPath.length == cgPath.length, "Length was incorrect")
		
		let length = loopPath.length
		
		assert(length == 482.2257336303885, "Length was incorrect")
	
		let halfPoint = loopPath.point(at: 0.5)
		
		assert(halfPoint == cgPath.point(at: 0.5), "Point was incorrect")
		
		let expectedPoint = CGPoint(x: 113.15372180142839, y: 126.26246219188792)

		assert(halfPoint == expectedPoint, "Point was incorrect")

	}


}
