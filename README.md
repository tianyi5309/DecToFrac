# DecToFrac
A little script that converts decimals to the simplest fraction

### Features
The script takes a string input of a decimal, then converts it into the simplest fraction (Rational) that rounds off to the decimal.

Note that the fraction must be round off and not truncated.

### Details
The script repeatedly flips the decimal part of the input, until the decimal part is close enough to 0.

Then, the script rebuilds the original fraction.

The precision (literal and percentage) is tracked throughout the computation and "close to 0" is defined as twice the precision (to take into account of inaccuracies). Also tests if the fraction actually rounds off to input.

### Changelog
10 Aug - Initial commit

11 Aug - Fixed bugs with dividing by zero and pushed integer into array regardless of size

### TODO
- Use Euclidean algorithm to avoid float inaccuracies

- Also check for square roots / cube roots etc

- Support negative numbers

- Support input of decimals < 1 like ".1234"