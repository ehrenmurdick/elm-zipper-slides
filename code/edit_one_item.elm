module Main exposing (..)


type alias Slide =
    { title : String
    }


type alias Model =
    { currentIndex : Int
    , slides : List Slide
    }


init : Model
init =
    { currentIndex = 0
    , slides =
        [ { title = "first" }
        , { title = "second" }
        ]
    }


next : Model -> Model
next model =
    if model.currentIndex < (List.length model.slides) - 1 then
        { model | currentIndex = model.currentIndex + 1 }
    else
        model


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
