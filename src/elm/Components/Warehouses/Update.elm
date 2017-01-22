module Components.Warehouses.Update exposing (..)

import Form exposing (Form)

import Components.Warehouses.Messages exposing (Msg(..))
import Components.Warehouses.Models   exposing (Warehouse, WarehouseId, WarehouseModel)
import Components.Warehouses.Commands exposing (save)
import Navigation

update : Msg -> WarehouseModel -> ( WarehouseModel, Cmd Msg )
update message ({ form, errors, warehouse, warehouses } as model) =
    case message of
        OnFetchAll (Ok newWarehouses) ->
            ( { model | warehouses = newWarehouses }, Cmd.none )
 
        OnFetchAll (Err error) ->
            ( model, Cmd.none )

        ShowWarehouses ->
            ( model, Navigation.newUrl "#warehouses" )

        ShowWarehouse id ->
            ( model, Navigation.newUrl ("#warehouses/" ++ Maybe.withDefault "" id) )

        GotoNewWarehouse ->
            ( model, Navigation.newUrl ("#warehouses/new") )

        ChangeWarehouse id name ->
            ( model, changeWarehouse id name warehouses |> Cmd.batch )

        FormMsg formMsg ->
            case ( formMsg, Form.getOutput form ) of
                ( Form.Submit, Just warehouse ) ->
                    ( model, Cmd.none )

                _ ->
                    ( { model | form = Form.update formMsg form }, Cmd.none )

        OnSave (Ok updatedWarehouse) ->
            ( { model | warehouses = updateWarehouse updatedWarehouse warehouses }, Cmd.none )

        OnSave (Err error) ->
            ( model, Cmd.none )

changeWarehouse : Maybe WarehouseId -> String -> List Warehouse -> List (Cmd Msg)
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
