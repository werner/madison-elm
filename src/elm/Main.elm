module Main exposing (..)

import Messages   exposing (Msg(..))
import Models     exposing (Model, initialModel)
import Update     exposing (update)
import View       exposing (view)
import Navigation exposing (Location)
import Components.Warehouses.Commands exposing (fetchAll)
import Routing exposing (Route)

import Update exposing (update)
import View exposing (view)

init : Location -> ( Model, Cmd Msg )
init location =
    let currentRoute = 
        Routing.parseLocation location
    in
        ( initialModel currentRoute, Cmd.map WarehousesMsg fetchAll )

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
