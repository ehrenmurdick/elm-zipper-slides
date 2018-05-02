module Main exposing (..)


type alias Model =
    { currentIndex : Int
    , slides : List Slide
    }


updateCurrentSlideTitle : String -> Model -> Model
updateCurrentSlideTitle newTitle model =
    let
        newSlides =
            List.indexedMap
                (\idx slide ->
                    if idx == model.currentIndex then
                        { slide | title = newTitle }
                    else
                        slide
                )
                model.slides
    in
        { model | slides = newSlides }
