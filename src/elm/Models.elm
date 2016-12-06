module Models exposing (..)

import Components.Warehouses.Models exposing (Warehouse)

type alias Model =
    { warehouses : List Warehouse }

initialModel : Model
initialModel = { warehouses = [] }
