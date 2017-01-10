module Main exposing (..)

import Messages   exposing (Msg(..))
import Models     exposing (Model, initialModel)
import Update     exposing (update)
import View       exposing (view)
import Navigation exposing (Location)
import Routing exposing (Route)

import Update exposing (update)
import View exposing (view)

import Ports.LocalStorage exposing (..)

init : Location -> ( Model, Cmd Msg )
init location =
    let currentRoute = 
        Routing.parseLocation location
    in
        ( initialModel currentRoute, doloadStorage "currentUser" )

subscriptions : Model -> Sub Msg
subscriptions model = 
    Sub.batch
      [ 
        loadStorage LoadLocalStorage
      ]

main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
