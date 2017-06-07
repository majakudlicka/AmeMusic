module BeginningElm exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html exposing (beginnerProgram)
import Html.Events exposing (..)

model =
   { showRecords = False }

type Msg =
    ShowRecords | HideRecords

update msg model_ =
    case msg of
        ShowRecords -> { model_ | showRecords = True }
        HideRecords -> { model_ | showRecords = False }

view model_ =
    div [ class "container" ]

        [ h1 [] [ text "Ame Music" ]
        , button [ onClick ShowRecords]
            [ text "Uplad File" ]
        , button [onClick HideRecords]
            [ text "Show Recent Tracks" ]
        , if model_.showRecords then
            input [ type_ "file", placeholder "Upload your file" ] []
            else
              text "list of records here"
        ]


main =
    beginnerProgram
       { model = model
       , update = update
       , view = view
       }
