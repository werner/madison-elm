module Models exposing (..)

import Components.Warehouses.Models exposing (Warehouse)
import Routing

type alias Model =
    { warehouses : List Warehouse
    , route : Routing.Route }

initialModel : Routing.Route -> Model
initialModel route = { warehouses = []
                     , route = route }
