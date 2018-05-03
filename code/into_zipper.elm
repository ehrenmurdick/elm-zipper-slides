module Main exposing (..)


type Zipper a
    = Zipper a (List a) (List a)


type alias Model =
    { slides : Zipper Slide
    }


next : Zipper a -> Zipper a
next zipper =
    let
        (Zipper current next prev) =
            zipper
    in
        case next of
            [] ->
                zipper

            x :: xs ->
                Zipper x xs (current :: prev)


updateCurrentSlideTitle : String -> Model -> Model
updateCurrentSlideTitle newTitle model =
    model
