module Components.Warehouses.List exposing (..)

import Html exposing (..)
import Html.Attributes as Attr
import Components.Warehouses.Messages as WarehouseMsg exposing (..)
import Components.Warehouses.Models exposing (WarehouseModel, Warehouse)
import Html.Events exposing (onClick)
import Diyalog

import MainCss exposing (..)
import Components.Warehouses.Css exposing (..)

import Html.CssHelpers

{ id, class, classList } =
    Html.CssHelpers.withNamespace "madison"

view : String -> WarehouseModel WarehouseMsg.Msg -> Html WarehouseMsg.Msg
view token model = 
    div [ ]
        [ list model ]

list : WarehouseModel WarehouseMsg.Msg -> Html WarehouseMsg.Msg
list ({ warehouses, modalForm } as model) = 
    div [ Attr.class "container" ]
        [ div [ Attr.class "row" ]
              [ div [ Attr.class "col s12 l12" ]
                    [ div [ Attr.class "card-panel" ]
                          [ div [ Attr.class "row center valign-wrapper" ]
                                [ div [ Attr.class "left"] [ img  [ Attr.src "static/img/logo-nav.png" ] [] ]
                                , div [ class [ TitleNav ] ] 
                                      [ div  [] [ h4 [] [ text "Warehouses" ] ] ]
                                ]
                          , div [ Attr.class "row" ] 
                                [ listWarehouses warehouses ]
                          , div [ Attr.class "row" ]
                                [ div [ Attr.class "fixed-action-btn" ]
                                      [ button [ Attr.class "btn-floating btn-large waves-effect waves-light right"
                                               , onClick NewWarehouse ] 
                                               [ i [ Attr.class "material-icons" ] 
                                                   [ text "add" ]
                                               ]
                                      ]
                                ]
                          ] 
                    ]
              , Diyalog.view DiyalogMsg modalForm
              ]
        ]

listWarehouses : List Warehouse -> Html WarehouseMsg.Msg
listWarehouses warehouses = 
    ul [ Attr.class "collection" ] <| List.map warehouseRow warehouses

warehouseRow : Warehouse -> Html WarehouseMsg.Msg
warehouseRow warehouse = 
    li [ Attr.class "collection-item avatar" ]
       [ img  [ Attr.src "static/img/box_small.png", class [ WarehouseIcon ] ] [] 
       , span [ Attr.class "title", class [ WarehouseName ] ] [ strong [] [ text "ID:" ] 
                                                              , text ( toString <| Maybe.withDefault 0 warehouse.id ) ]
       , br [] []
       , span [ Attr.class "title", class [ WarehouseName ] ] [ strong [] [ text "Name: " ]
                                                              , text warehouse.name ]
       , a [ Attr.class "secondary-content"
           , class [ RegularLink ]
           , onClick <| EditWarehouse warehouse.id warehouse.name ] [ text "Edit" ] ]
