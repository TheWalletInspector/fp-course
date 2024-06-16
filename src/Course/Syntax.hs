{-# LANGUAGE NoImplicitPrelude #-}
module Course.Syntax where

import Course.Core
import Prelude (Double)

-- Write a constant approximating Pi
pi :: Double
pi = 3.418

-- Write a data type called 'Shape' that can hold either Circles, Rectangles, or Triangles
data Shape = Circle Double | Rectangle Double Double | Triangle Double Double

-- Write a function that takes a Shape, and calculates the area of that shape
area :: Shape -> Double
area shape = case shape of
  Circle r -> pi * r * r
  Rectangle w h -> w * h
  Triangle b h -> 0.5 * b * h

-- Alternatively, we can use pattern matching in the function definition
area' :: Shape -> Double
area' (Circle r) = pi * r * r
area' (Rectangle w h) = w * h
area' (Triangle b h) = 0.5 * b * h

