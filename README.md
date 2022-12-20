# Advent of Code 2022

My attempt to solve https://adventofcode.com/2022 in [Pharo](https://pharo.org/).
This is basically an excuse to play with Pharo an learn more about it.

The exercises of Advent of Code are hard to implement in OO languages in a dogmatic way: they are basically a big loop with complex control flow and a bunch of simple basic variables: numbers, strings, arrays, matrices. OO Design is superfluous (no entity or responsibility, no code reuse, etc.). So Pharo strengths should be that useful, and that's why it is a good exercise. :)

One thing that should be nice is the standard library of Pharo and how it provides **discoverable** handy methods to solve the various assignments.

## Disclamers

* Often, I did try something. If it works on the first try, I keep it, even if I thought of a smarter way later. If it doesn't work, then I hack until it does, but crufts and useless things may remain.
* I'm not an expert at Pharo, so code might not be the right way to do things (more complex or fragile than needed).

## Basic design

### Classes & methods

There is usually no entry point in pharo, so where to put the code?

I choose to have them in class-side methods. The original intent was to be able to use the `<script>` pragma, eventually I did not use them.
So the main class is `Advent2022` in the eponymous package. Exercises are classe-side methods named `dayXX:` where the parameter is the initial data (String).
There is possible variations: `dayXXbis:` for the second part, or `dayXX:bis:` when both parts are merged (that additional parameter takes a boolean).

Sub methods are rare. Mainly because methods in Pharo are not tightly coupled in the editor: they do not share the same textarea so cutting-pasting and refactorization are cumbersome for such little piece of code.

### Data

Pharo is a live object system, but I did not find a nice way to add external resources (here text) in a live image (I did not search that much). So I moved input data into class-side methods that just return a literal string.
Names are `dayXXsample` for the sample in the subject description and `dayXXdata` for the specific data associated to my account.

### Running

Instead of `<script>` I used executable comments. The tool need more love, but it makes it easy to DoIt.
Having a real test-suite seems too much work, and I'm lazy.

## Special Remarks

### Control flow

In nice OOP design and programming, the various conditionals are usually delegated/shared among entities with the best responsibility, and abstracted into meaningful methods. It's very bad practice to peek low level values of random indirect objects when you write `ifTrue:` or to combine them in some various complex boolean expression.

Unfortunately, many exercises of advent of code need us to deal with conditional involving many variables. This causes a mess of parentheses and brackets in Pharo.

Another limitation is the lack of control flow break/continue in loops or other blocks.

*update* Some people just introduced me about `BlockClosure>>#valueWithExit`. This one is a smart and tricky method to implement break/continue. I might use it :)

### String manipulations

Pharo have a lot of methods in String and in its superclasses (as Strings are Collections).

* split lines with `String>>#linesDo:`
* split things with `String>>#splitOn:`. I added `splitOnAny:`
* use regular expressions for finer matching. **Warning** The documentation of regex (in the help browser) is BAD and does not even show subexpressions (maybe subexpressions were not even implemented when the doc was written?). So I did use a lot of `splitOn:` before I figured out that subexpressions are available.
  ```.st
   matcher := '(\d+) (\d+)' asRegex.
   matcher matches: line.
   data1 := (matcher subexpression: 2) asInteger;
   ```

### Array manipulations

1D Arrays and collections are fine.

The API of Array2D is very frustrating, especially because it provides only a subset of what 1D Arrays can do and because indices are distinct parameters. Maybe using Points as keys might be nice: you can then reuse a lot of the API of collection once you assume the key/index is a single object (a pair).

One other limitation is the lack of 2D grid  (think cellular automata for instance) that feature neighbors and behave correctly on edges. Array2D is very low level, so I sometimes used Dictionaries of Points.

### Graph manipulations

Initially I tried to use things from `AI-Algorithms-Graph` but the API and documentations is limited.

I extended some classes from this package (with new instance variable) so I do not know how to publish that (the class extension mechanism of Pharo seems limited to method).
