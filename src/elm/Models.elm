module Models exposing (..)

import Components.Warehouses.Models exposing (Warehouse)
import Components.Login.Models exposing (User)
import Routing

type alias Model =
    { warehouses : List Warehouse
    , user : User
    , route : Routing.Route }

initialModel : Routing.Route -> Model
initialModel route = { warehouses = []
                     , user = User "" ""
                     , route = route }
