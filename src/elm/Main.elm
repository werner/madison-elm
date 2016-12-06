module Main exposing (..)

import Html     exposing (Html, div, text, program)
import Messages exposing (Msg(..))
import Models   exposing (Model, initialModel)
import Update   exposing (update)
import View     exposing (view)

import Components.Warehouses.Commands exposing (fetchAll)

init : ( Model, Cmd Msg )
init = ( initialModel, Cmd.map WarehousesMsg fetchAll )

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
