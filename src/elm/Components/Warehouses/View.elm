module Components.Warehouses.View exposing (..)

import Html exposing (Html)

import ViewHelpers exposing (notFoundView)
import Components.Warehouses.Models exposing ( WarehouseId, Warehouse, WarehouseModel )
import Components.Warehouses.Messages exposing (Msg(..))
import Components.Warehouses.List as List exposing (view)
import Components.Warehouses.New  as New exposing (view)
import Components.Warehouses.Routing exposing (WarehouseRoute(..))

view : String -> WarehouseRoute -> WarehouseModel Msg -> Html Msg
view token msg ({ form, errors, warehouse, warehouses } as model) =
    case msg of
        WarehouseList    -> List.view token model
        WarehouseNew     -> New.view <| New.body model
