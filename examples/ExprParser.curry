---------------------------------------------------------------------------
-- A simple example for the use of the functional logic parser combinators:
-- We define a parser for arithmetic expressions over natural numbers.
-- The presentation of this parser is the value of the expression.

import Prelude hiding ( (<*>), some )
import Data.Char

import Parser

expression   =  term t <*> terminal '+' <*> expression e  >>> (t + e)
           <||> term t <*> terminal '-' <*> expression e  >>> (t - e)
           <||> term
 where t,e free

term         =  factor f <*> terminal '*' <*> term t      >>> (f * t)
           <||> factor f <*> terminal '/' <*> term t      >>> (f `div` t)
           <||> factor
 where f,t free

factor       =  terminal '(' <*> expression e <*> terminal ')'  >>> e
           <||> num
 where e free

num = some digit l >>> numeric_value l
  where l free
        numeric_value ds = foldl1 ((+) . (10*)) (map (\c->ord c - ord '0') ds)

digit = satisfy isDigit


-- Example:
ex1 :: Int
ex1 | expression val "(10+5*2)/4" =:= []
    = val                                       where val free
