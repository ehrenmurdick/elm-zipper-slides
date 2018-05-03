module Main exposing (..)


type Zipper a
    = Zipper a (List a) (List a)


type alias Model =
    { slides : Zipper Slide
    }


init : Model
init =
    { slides =
        Zipper { title = "first" }
            [ { title = "second" } ]
            []
    }


prev : Zipper a -> Zipper a
prev =
    flip << next << flip


flip : Zipper a -> Zipper a
flip zipper =
    let
        (Zipper x xs ys) =
            zipper
    in
        (Zipper x ys xs)


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
    let
        (Zipper current next prev) =
            model.slides

        updatedSlide =
            { current | title = newTitle }

        newSlides =
            (Zipper updatedSlide next prev)
    in
        { model | slides = newSlides }
