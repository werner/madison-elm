module Components.Warehouses.Update exposing (..)

import Form exposing (Form)
import Html.Attributes exposing (class)
import Ports.InfiniteScroll exposing (..)

import Components.Warehouses.Messages as WarehouseMsg exposing (Msg(..))
import Components.Warehouses.Models   exposing (Warehouse, WarehouseId, WarehouseModel)
import Components.Warehouses.Commands exposing (save, fetchAll)
import Components.Warehouses.New exposing (view, header, body, footer)
import Diyalog
import Diyalog.Message exposing (..)

update : String -> WarehouseMsg.Msg -> WarehouseModel WarehouseMsg.Msg ->
    ( WarehouseModel WarehouseMsg.Msg, Cmd WarehouseMsg.Msg )
update token message ({ form, errors, warehouse, warehouses, modalForm } as model) =
    case message of
        OnFetchAll init (Ok newWarehouses) ->
            if init then
                ( { model | warehouses = newWarehouses }, initializeOffset () )
            else
                ( { model | warehouses = warehouses ++ newWarehouses }, Cmd.none )
 
        OnFetchAll init (Err error) ->
            ( model, Cmd.none )

        ShowWarehouses tok offset ->
            ( model, fetchAll tok offset )

        EditWarehouse id name ->
            let (updateModal, cmd) =
                Diyalog.update Diyalog.Message.ShowingModal { modalForm | headerTitle = "Edit Warehouse"
                                                                        , body = body { model | warehouse = Warehouse id name } }
            in
                ( { model | modalForm = updateModal }, Cmd.none )

        NewWarehouse ->
            let (updateModal, cmd) = 
                Diyalog.update Diyalog.Message.ShowingModal { modalForm | headerTitle = "New Warehouse"
                                                                        , body = body model }
            in
                ( { model | modalForm = updateModal }, Cmd.none )

        DiyalogMsg diyalogMsg ->
            let (updateModal, cmd) = 
                Diyalog.update diyalogMsg { modalForm | fullHeader = header model
                                                      , mainModalCss = class "modal"
                                                      , modalContentCss = class "modal-content"
                                                      , fullBody = view 
                                                      , fullFooter = footer }
            in
                ( { model | modalForm = updateModal }, Cmd.none )

        ChangeWarehouse id name ->
            ( model, changeWarehouse token id name warehouses |> Cmd.batch )

        FormMsg formMsg ->
            case ( formMsg, Form.getOutput form ) of
                ( Form.Submit, Just formWarehouse ) ->
                    let (updateModal, cmd) = Diyalog.update Diyalog.Message.OkModal modalForm
                    in
                    ( { model | modalForm = updateModal }, save formWarehouse token )

                _ ->
                    ( { model | form = Form.update formMsg form }, Cmd.none )

        OnSave tok (Ok updatedWarehouse) ->
            ( model, fetchAll tok 0 )

        OnSave tok (Err error) ->
            ( model, Cmd.none )

changeWarehouse : String -> Maybe WarehouseId -> String -> List Warehouse -> List (Cmd WarehouseMsg.Msg)
changeWarehouse token warehouseId newName warehouses = 
    let
        cmdForWarehouse existingWarehouse = 
            if existingWarehouse.id == warehouseId then
                save { existingWarehouse | name = newName } token
            else
                Cmd.none
    in
        List.map cmdForWarehouse warehouses
