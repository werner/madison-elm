module View exposing (..)

import Html     exposing (Html, div, text)
import Messages exposing (Msg(..))
import Models   exposing (Model)
import Components.Warehouses.Edit
import Components.Warehouses.List
import Components.Warehouses.Models exposing (WarehouseId)
import Routing exposing (Route(..))

view : Model -> Html Msg
view model = 
    div []
        [ page model ]

page : Model -> Html Msg
page model = 
    case model.route of
        WarehousesRoute ->
            Html.map WarehousesMsg (Components.Warehouses.List.view model.warehouses) 

        WarehouseRoute id -> 
            warehouseEditPage model id

        NotFoundRoute ->
            notFoundView

warehouseEditPage : Model -> WarehouseId -> Html Msg
warehouseEditPage model warehouseId = 
    let
        maybeWarehouse =
            model.warehouses
                |> List.filter (\warehouse -> warehouse.id == warehouseId)
                |> List.head
    in
        case maybeWarehouse of
            Just warehouse ->
                Html.map WarehousesMsg ( Components.Warehouses.Edit.view warehouse)

            Nothing ->
                notFoundView

notFoundView : Html msg
notFoundView = 
    div []
        [ text "Not found" ]
