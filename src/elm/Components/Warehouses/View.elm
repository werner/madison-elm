module Components.Warehouses.View exposing (..)

import Html exposing (Html)

import ViewHelpers exposing (notFoundView)
import Components.Warehouses.Models exposing ( WarehouseId, Warehouse, WarehouseModel )
import Components.Warehouses.Messages exposing (Msg(..))
import Components.Warehouses.List as List exposing (view)
import Components.Warehouses.Edit as Edit exposing (view)
import Components.Warehouses.New  as New exposing (view)
import Components.Warehouses.Routing exposing (WarehouseRoute(..))

view : WarehouseRoute -> WarehouseModel -> Html Msg
view msg ({ form, errors, warehouse, warehouses } as model) =
    case msg of
        WarehouseList    -> List.view model
        WarehouseNew     -> New.view model
        WarehouseShow id -> warehouseEditPage warehouses id

warehouseEditPage : List Warehouse -> WarehouseId -> Html Msg
warehouseEditPage warehouses warehouseId = 
    let
        maybeWarehouse =
            warehouses
                |> List.filter (\warehouse -> warehouse.id == (Just warehouseId))
                |> List.head
    in
        case maybeWarehouse of
            Just warehouse ->
                Edit.view warehouse

            Nothing ->
                notFoundView
