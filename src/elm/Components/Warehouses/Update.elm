module Components.Warehouses.Update exposing (..)

import Components.Warehouses.Messages exposing (Msg(..))
import Components.Warehouses.Models   exposing (Warehouse, WarehouseId)
import Components.Warehouses.Commands exposing (save)
import Navigation

update : Msg -> List Warehouse -> ( List Warehouse, Cmd Msg )
update message warehouses =
    case message of
        OnFetchAll (Ok newWarehouses) ->
            ( newWarehouses, Cmd.none )

        OnFetchAll (Err error) ->
            ( warehouses, Cmd.none )

        ShowWarehouses ->
            ( warehouses, Navigation.newUrl "#warehouses" )

        ShowWarehouse id ->
            ( warehouses, Navigation.newUrl ("#warehouses/" ++ id) )

        ChangeWarehouse id name ->
            ( warehouses, changeWarehouse id name warehouses |> Cmd.batch )

        OnSave (Ok updatedWarehouse) ->
            ( updateWarehouse updatedWarehouse warehouses, Cmd.none )

        OnSave (Err error) ->
            ( warehouses, Cmd.none )

changeWarehouse : WarehouseId -> String -> List Warehouse -> List (Cmd Msg)
changeWarehouse warehouseId newName warehouses = 
    let
        cmdForWarehouse existingWarehouse = 
            if existingWarehouse.id == warehouseId then
                save { existingWarehouse | name = newName }
            else
                Cmd.none
    in
        List.map cmdForWarehouse warehouses

updateWarehouse : Warehouse -> List Warehouse -> List Warehouse
updateWarehouse updatedWarehouse warehouses = 
    let
        select existingWarehouse =
            if existingWarehouse.id == updatedWarehouse.id then
                updatedWarehouse
            else
                existingWarehouse
    in
        List.map select warehouses
