# [UI/NS]BezierPath + Length

[![Swift](https://img.shields.io/badge/Swift-3.0.1-orange.svg?style=flat")](https://developer.apple.com/swift/)
![Platform](https://img.shields.io/badge/Platforms-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20watchOS-lightgrey.svg)
[![Twitter](https://img.shields.io/badge/Twitter-@LouisDhauwe-blue.svg?style=flat)](http://twitter.com/LouisDhauwe)

This project provides a simple API to get the length of either a UIBezierPath or NSBezierPath. Example:

There's also an API for getting a point on a path at a certain percentage, example:

## Requirements

* iOS 8.0+ / macOS 10.9+
* Xcode 8.1+

## How does it work?

The actual calculations are implemented on a CGPath extension, but a [UI/NS]BezierPath extension is available for convenience.

Any CGPath can be split into subpaths. Of which there are three types:

* Linear
* Quadratic curve
* Cubic curve
 
 
See [calculations.md](calculations.md) for a detailed mathematical explanation of how the length of these three can be calculated.



## License

TBD