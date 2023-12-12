{-# LANGUAGE NoImplicitPrelude #-}
module Course.Syntax where

import Course.Core
import Prelude (Double, sqrt)

-- Write a constant approximating Pi
pi :: Double
--pi = error "todo: Course.Synatx#pi"
pi = 3.418

-- Write a data type called 'Shape' that can hold either Circles, Rectangles, or Triangles
--data Shape = NotYetImplemented
data Shape = Circle Double | Rectangle Double Double | Triangle Double Double Double
  deriving (Eq, Show)

-- Write a function that takes a Shape, and calculates the area of that shape
area :: Shape -> Double
--area = error "todo: Course.Synatx#area"
area (Circle r) = pi * r * r
area (Rectangle w h) = w * h

area (Triangle a b c) = sqrt (s * (s - a) * (s - b) * (s - c))
  where s = (a + b + c) / 2
--area (Triangle a b c) =
--  let s = (a + b + c) / 2
--  in sqrt (s * (s - a) * (s - b) * (s - c))
