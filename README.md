fl-parser: Functional logic parser combinators
==============================================

This package contains a library with functional logic parser combinators.

The idea and structure of these combinators are adapted from:

    Rafael Caballero and Francisco J. Lopez-Fraguas:
    A Functional Logic Perspective of Parsing.
    In Proc. FLOPS'99, Springer LNCS 1722, pp. 85-99, 1999

This paper contains a detailed description of the idea and usage
of these parser combinators.

The `examples` directory contains examples for using
these combinators for parsing.

* `Palindrome.curry`:
  a parser for palindromes over the alphabet 'a' and 'b'
  showing also the possibility to generate correct sentences
  with functional logic parsers
* `ExprParser.curry`: a parser for arithmetic expressions over natural numbers

--------------------------------------------------------------------------
