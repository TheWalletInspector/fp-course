{-# LANGUAGE ImplicitPrelude #-}

-- Ignore these lines for now
module Course.Scratch where
import Data.String

-- Organisation / Intro:
-- Bit about me
-- What this course is, and where it comes from
-- Questions in Slack! (ask as we go)
-- I'll post some polls after we're done


-- Basic values and assignments
-- Int, Double, String, Bool, List

a :: Int
a = 42

b :: Double
b = 3.14

c :: String
c = "Hello, World"

d :: Bool
d = True

e :: [Int]
e = [1,2,3]

-- Identifiers can have type signatures

-- Functions
-- Lambda syntax (equivalent)
-- Functions have types too
-- Show functions in REPL (don't forget to import Prelude)

f :: Int -> Int
f x = x + 1
-- Equivalent:
-- f = \x -> x + 1

g :: Int -> Int -> Int
g x y = x + y
-- Equivalent
-- g = \x y -> x + y
-- g = \x -> \y -> x + y

-- -> is right associative
-- All functions take *exactly* one argument and return *exactly* one value.

-- Operators infix, prefix
h :: Int
h = (+) 1 2
-- Equivalent
-- h = 1 + 2

j :: Int
j = 1 `g` 2
-- Equivalent
-- j = g 1 2

-- Operators are functions too
-- Show in REPL
(#) :: Int -> Int -> Int
(#) x y = x + y

-- Type variables always lowercase, polymorphism:
-- Javaish:
-- <A> A i(A x) { return x; }
i :: a -> a
i x = x

-- Data types
-- 'data' keyword
-- Product type

data Human = Human String Int

josh :: Human
josh = Human "Josh" 34

-- Sum type
data Z = Foo | Bar

zz :: Z
zz = Foo

-- Can use these to create our own Booleans:
data Bool' = True' | False'

-- Deriving
-- (Show, Eq, Ord, etc)
-- Show in REPL

-- Sum types constuctors can take arguments just like Product types

data A = Baz String | Quux Int

-- Pattern matching on constructors

k :: A -> String
k (Baz s) = s ++ s
k (Quux q) = show (q * q)

-- Case statements

l :: A -> String
l a = case a of
  Baz s -> s ++ s
  Quux q -> show (q * q)

-- Record syntax

data Human' = Human' { name :: String, age :: Int }

josh' :: Human'
josh' = Human' { name = "Josh", age = 34 }

-- Generic types

data Possibly a = Nope | Yep a

-- Recursive data types

data LinkedList a = EmptyList | NonEmpty a (LinkedList a)

-- Typeclasses (implement Eq)

-- class Eq a where
--   (==) :: a -> a -> Bool

instance Eq Human where
  (==) (Human name1 age1) (Human name2 age2) = name1 == name2 && age1 == age2

instance Eq a => Eq (Possibly a) where
  (==) Nope Nope = True
  (==) (Yep x) (Yep y) = x == y
  (==) _ _ = False

-- Typeclasses (implement our own typeclass for ToString)

class ToString a where
  toString :: a -> String

instance ToString Human where
  toString (Human name age) = name ++ " is " ++ show age ++ " years old"

instance ToString a => ToString (Possibly a) where
  toString Nope = "Nope"
  toString (Yep x) = "Yep " ++ toString x

-- Typeclasses are NOT Classes. More like Interfaces. Much more like Traits
-- Implement ToString for a few types

-- type vs newtype vs data

-- type is just an alias
-- Useful for giving more precise names to existing types
-- CANNOT attach new typeclasses
-- e.g. Name and String are entirely interchangable
type Name = String

-- newtype is a wrapper around an existing type
-- Must have _exactly_ one constructor and _exactly_ one field.
-- e.g. Age and Int are NOT interchangable.
-- ZERO runtime cost!
-- CAN attach new typeclasses
-- May automatically derive any typeclass that exists for the underlying type
-- Must pattern match to get at the underlying value
newtype Age = Age Int

-- data is for everything else
-- Can have multiple fields and/or multiple constructors
-- Can attach new typeclasses

-- Demonstrate a couple of useful features of ghci
-- :t
-- :i
-- :q

-- Quickly show IO is not hard
