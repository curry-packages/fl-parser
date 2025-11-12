---------------------------------------------------------------------------
-- A simple example for the use of the functional logic parser combinators
-- to define palindromes.

import Prelude hiding ( (<*>), (<|>), empty )

import Control.Search.AllValues ( getAllValues ) -- for simple tests

import Parser

-- A parser for palindromes over the alphabet 'a' and 'b'

-- Terminals:
a = terminal 'a'
b = terminal 'b'

-- Palindromes:
pali = empty <|> a <|> b <|> a<*>pali<*>a <|> b<*>pali<*>b

{-
Examples:

Check correctness of a sentence:

> pali "abaaba" =:= []


Generate palindromes:

> pali [x,y,z] =:= []  where x,y,z free
-}


-- Generate list of all palindromes of length 5:
pali5 :: String
pali5 | xs =:= [_,_,_,_,_] & pali xs =:= [] = xs
 where xs free

-- Returns all palindromes of length 5:
allPali5 :: IO [String]
allPali5 = getAllValues pali5

-- Generate palindromes of a given length:
paliN len | strlen xs len & pali xs =:= [] = xs
 where
  xs free

  -- Relate a list to its length (used to generate fixed-length lists):
  strlen []     0       = True
  strlen (_:ys) n | n>0 = strlen ys (n-1)

-- Returns all palindromes of length prpvided as the argument:
allPaliN :: Int -> IO [String]
allPaliN n = getAllValues (paliN n)
