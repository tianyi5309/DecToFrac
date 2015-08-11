# DecToFrac
A little script that converts decimals to the simplest fraction / root of a fraction.

### Features
The script takes a string input of a decimal, then converts it into the simplest fraction (Rational) or root of a fraction that rounds off to the decimal.

A minimum amount of answers are returned (num_terms).

Note that the fraction must be round off and not truncated.

### Details
The script uses Euclidean Algorithm(EA) to decompose the numerator and denominator, until a fraction rounds off to the input.

Then, the script rebuilds the original fraction.

The script checks for various powers using dovetailing:

T1 - EA on power 1

T2 - EA on power 1, 2

T3 - EA on power 1, 2, 3

and so on...

### Changelog
10 Aug - Initial commit

11 Aug - Fixed bugs with dividing by zero and pushed integer into array regardless of size

11 Aug - Changed code to use Euclidean Algorithm (To avoid floating inaccuracies)

11 Aug - Checks for roots and implements dovetailing

### TODO
- Support negative numbers

- Support input of decimals < 1 like ".1234"

- Factor integers out of roots

- Compute uncertainty to reduce building fraction and testing (Previously done and scrapped due to inaccuracy / complexity)

- Figure out a way to better pick the best/simplest number

- LATEX support