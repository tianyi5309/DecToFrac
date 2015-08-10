# DecToFrac
A little script that converts decimals to the simplest fraction

### Features
The script takes a string input of a decimal, then converts it into the simplest fraction (Rational) that rounds off to the decimal.

Note that the fraction must be round off and not truncated.

### Details
The script repeatedly flips the decimal part of the input, until the decimal part is close enough to 0.

Then, the script rebuilds the original fraction.

The precision (literal and percentage) is tracked throughout the computation and "close to 0" is defined as twice the precision (to take into account of inaccuracies). Also tests if the fraction actually rounds off to input.