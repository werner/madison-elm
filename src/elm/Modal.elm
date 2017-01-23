module Modal exposing (..)

import Dialog
import Html
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

type Msg
    = ShowModal
    | CloseModal
    | OkModal

type alias Model msg =
    { header     : Html msg
    , body       : Html msg
    , showDialog : Bool
    , okAction   : Cmd msg }

update : Msg -> Model Msg -> ( Model Msg, Cmd Msg )
update action model =
    case action of
        ShowModal ->
            ( { model | showDialog = True }
            , Cmd.none
            )

        CloseModal ->
            ( { model | showDialog = False }
            , Cmd.none
            )

        OkModal ->
            ( { model | showDialog = False }
            , model.okAction
            )

dialogConfig : Html Msg -> Html Msg -> Dialog.Config Msg
dialogConfig header body =
    { closeMessage = Just CloseModal
    , containerClass = Nothing
    , header = Just header
    , body = Just body
    , footer =
        Just
            (button
                [ class "btn"
                , onClick OkModal
                ]
                [ text "OK" ]
            )
    }
