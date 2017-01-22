module Components.Warehouses.View exposing (..)

import Html exposing (Html)

import ViewHelpers exposing (notFoundView)
import Components.Warehouses.Models exposing ( WarehouseId, Warehouse )
import Components.Warehouses.Messages exposing (Msg(..))
import Components.Warehouses.List as List exposing (view)
import Components.Warehouses.Edit as Edit exposing (view)
import Components.Warehouses.Routing exposing (WarehouseRoute(..))

view msg warehouses =
    case msg of
        WarehouseList    -> List.view warehouses
        WarehouseShow id -> warehouseEditPage warehouses id

warehouseEditPage : List Warehouse -> WarehouseId -> Html Msg
warehouseEditPage warehouses warehouseId = 
    let
        maybeWarehouse =
            warehouses
                |> List.filter (\warehouse -> warehouse.id == warehouseId)
                |> List.head
    in
        case maybeWarehouse of
            Just warehouse ->
                Edit.view warehouse

            Nothing ->
                notFoundView
