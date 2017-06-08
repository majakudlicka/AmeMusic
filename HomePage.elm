module BeginningElm exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode exposing (int, string, list, decodeString, Decoder)
import Task exposing (Task, andThen)

data : String
data =
    """
    [
      {
      "track id_number": 2,
      "Artist": "Anthony Naples",
      "Title": "Refugio"
      }
    ]
  """

type alias TrackID =
  { artist : String
  , title : String
}

trackIDDecoder : Decoder TrackID
trackIDDecoder =
  decode
    TrackID
    |> required "Artist" string
    |> required "Title" string

main : Html msg
main =
  let
    source =
      decodeString (list trackIDDecoder) data



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
            { model_ | showRecords = True }

        ShowArchive ->
            { model_ | showArchive = True }

        HideArchive ->
            { model_ | showArchive = False }

        ShowTrackList ->
            { model_ | showTrackList = True }

        HideTrackList ->
            { model_ | showTrackList = False }


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
                    [ li [ class "tracklistItem" ] [ text "song 1" ]
                    , li [ class "tracklistItem" ] [ text "song 2" ]
                    , li [ class "tracklistItem" ] [ text "song 3" ]
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
    beginnerProgram
        { model = model
        , update = update
        , view = view
        }
