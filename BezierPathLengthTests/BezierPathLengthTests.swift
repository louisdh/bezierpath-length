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
	
	func testRectangleLength() {
		
		let rect = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
		let path = UIBezierPath(rect: rect)

		let length = path.length
		
		assert(length == 400.0, "Length was incorrect")
	}

}
