module BeginningElm exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


model =
    { showRecords = False
    , showArchive = False
    , hideArchive = True
    , showTrackList = False
    , hideTrackList = True
    }


type Msg
    = ShowRecords
    | ShowArchive
    | HideArchive
    | ShowTrackList
    | HideTrackList


update msg model_ =
    case msg of
        ShowRecords ->
            ({ model_ | showRecords = True }, Cmd.none)

        ShowArchive ->
            ({ model_ | showArchive = True }, Cmd.none)

        HideArchive ->
            ({ model_ | showArchive = False }, Cmd.none)

        ShowTrackList ->
            ({ model_ | showTrackList = True }, Cmd.none)

        HideTrackList ->
            ({ model_ | showTrackList = False }, Cmd.none)
            



init =
  (model , Cmd.none)
  


view model_ =
    div [ class "container" ]
        [ h1 [] [ text "Ame Music" ]
        , button [ onClick ShowRecords, class "mainButton" ]
            [ text "Upload File" ]
        , button [ onClick ShowArchive, class "mainButton" ]
            [ text "Show Recent Tracks" ]
        , if model_.showRecords then
            div []
                [ h1 [] []
                , input [ type_ "file", placeholder "Upload your file", class "uploadButton" ] []
                , button [ onClick ShowTrackList, class "confirmUploadButton" ] [ text "upload" ]
                ]
          else
            text ""
        , if model_.showArchive then
            div [ class "trackList" ]
                [ h2 [ class "tracklistHeading" ] [ text "Recent Tracks" ]
                , ul [ class "tracklistList" ]
                    [ li [ class "tracklistItem" ] [ text "Tracklist 1" ]
                    , li [ class "tracklistItem" ] [ text "Tracklist 2" ]
                    , li [ class "tracklistItem" ] [ text "Tracklist 3" ]
                    , button [ onClick HideArchive, class "closeButton" ]
                        [ text "close" ]
                    ]
                ]
          else
            text ""
        , if model_.hideArchive then
            text ""
          else
            text "something went wrong"
        , if model_.showTrackList then
            div [ class "trackList" ]
                [ h2 [ class "tracklistHeading" ] [ text "Tracklist" ]
                , ul [ class "tracklistList" ]
                    [ li [ class "tracklistItem" ] [ text "Albert Ayler, Ghosts" ]
                    , li [ class "tracklistItem" ] [ text "Anthony Naples, Refugio" ]
                    , li [ class "tracklistItem" ] [ text "0 Flynn, Tyrion" ]
                    , button [ onClick HideTrackList, class "closeButton" ]
                        [ text "close" ]
                    ]
                ]
          else
            text ""
        , if model_.hideTrackList then
            text ""
          else
            text "something went wrong"
        ]


main =
    program
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }