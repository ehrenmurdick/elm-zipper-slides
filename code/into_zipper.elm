module Main exposing (..)


type Zipper a
    = Zipper a (List a) (List a)
