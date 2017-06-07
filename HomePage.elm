module BeginningElm exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html exposing (beginnerProgram)
import Html.Events exposing (..)

model =
   { showRecords = False,
     showArchive = False,
     hideArchive = True
    }


type Msg =
      ShowRecords
    | ShowArchive
    | HideArchive

update msg model_ =
    case msg of
        ShowRecords -> { model_ | showRecords = True }
        ShowArchive -> { model_ | showArchive = True }
        HideArchive -> { model_ | showArchive = False }

view model_ =
    div [ class "container" ]

        [ h1 [] [ text "Ame Music" ]
        , button [ onClick ShowRecords, class "mainButton"]
            [ text "Upload File" ]
        , button [onClick ShowArchive, class "mainButton"]
            [ text "Show Recent Tracks" ]
        , a [ href "./public/cassette.html" ] [ text "submit"]
        , if model_.showRecords then
            input [ type_ "file", placeholder "Upload your file", class "uploadButton"] []
            else
              text ""
        , if model_.showArchive then
            div [ class "trackList" ]
                [ h2 [ class "tracklistHeading"] [text "Recent Tracks"]
                , ul [ class "tracklistList"]
                  [ li [ class "tracklistItem" ] [text "Tracklist 1"]
                  , li [ class "tracklistItem" ] [text "Tracklist 2"]
                  , li [ class "tracklistItem" ] [text "Tracklist 3"]
                  , button [onClick HideArchive, class "closeButton" ]
                    [ text "close" ]
                  ]
                ]
            else
              text ""
          , if model_.hideArchive then
              text ""
              else
                text "something went wrong"
        ]


main =
    beginnerProgram
       { model = model
       , update = update
       , view = view
       }
