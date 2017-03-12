module Components.Warehouses.Update exposing (..)

import Form exposing (Form)
import Html.Attributes exposing (class)
import Ports.InfiniteScroll exposing (..)

import Components.Warehouses.Messages as WarehouseMsg exposing (Msg(..))
import Components.Warehouses.Models   exposing (Warehouse, WarehouseId, WarehouseModel)
import Components.Warehouses.Commands exposing (save, fetchAll)
import Components.Warehouses.New exposing (view, header, body, footer)
import Navigation
import Diyalog
import Diyalog.Message as DiyalogMsg exposing (..)

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

        ShowWarehouse id ->
            ( model, Navigation.newUrl <| "#warehouses/" ++ (toString <| Maybe.withDefault 0 id) )

        DiyalogMsg diyalogMsg ->
            let (updateModal, cmd) = Diyalog.update diyalogMsg { modalForm | headerTitle = "Warehouse"
                                                                           , fullHeader = header model
                                                                           , body = body model
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
                ( Form.Submit, Just warehouse ) ->
                    let (updateModal, cmd) = Diyalog.update DiyalogMsg.OkModal modalForm
                    in
                    ( { model | modalForm = updateModal }, save warehouse token )

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
