# Bezier Path Calculations

Any CGPath can be split into subpaths. Of which there are three types:

* [Linear](#Linear)
* [Quadratic curve](#Quadratic-curve)
* [Cubic curve](#Cubic-curve)

When calculating the length of a CGPath we actually calculate the lengths of all the subpaths, and add those together. 

Linear
------

Linear is the most simple type, as it defines a straight line by two points. 

### Length
The following formula calculates the exact distance between two points:

> <img src="calculations-resources/linear-distance.png" height="40" alt="sqrt(pow(a.x-b.x, 2) + pow(a.y-b.y, 2))">

> *The order of the points is not important. The distance from ```A``` to ```B``` is equal to the distance from ```B``` to ```A```.*

### Parametric

Although there exists a formula to get the exact length between two points, it is useful to get a point on the path (meaning between the two points). For this a parametric formula is needed:

> <img src="calculations-resources/linear-parametric.png" height="30" alt="">
> 
> *```t``` is defined in the range 0...1 (inclusive), 
> where ```t = 0``` defines P0 and ```t = 1``` defines P1*
> 
> This parametric formula needs to be evaluated for both the x and y coordinates of the two points, with an equal value for ```t```.
> 
> Note that the ```t``` factors add up to 1 (```(1 - t) + t```), this is required for this type of formulas to work.
> 
> See [Linear Parametric Function.gcx](calculations-resources/Linear Parametric Function.gcx) for an interactive example. (Grapher is included on every Mac and can be found in ```Applications/Utilities```)


Quadratic curve
---------------
Quadratic curves are defined by two points and one control point. The control point does not necessarily  represent a point on the curve, but can rather be thought of as "magnetic point" which attracts a parabolic-shaped curve to it.

### Parametric


Cubic curve
-----------

### Parametric
