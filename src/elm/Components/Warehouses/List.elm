module Components.Warehouses.List exposing (..)

import Html exposing (..)
import Html.Attributes as Attr
import Components.Warehouses.Messages as WarehouseMsg exposing (..)
import Components.Warehouses.Models exposing (WarehouseModel, Warehouse)
import Html.Events exposing (onClick)
import Diyalog
import Diyalog.Message as DiyalgMsg exposing (..)

import MainCss exposing (..)

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
                                [ button [ Attr.class "btn-floating btn-large waves-effect waves-light right"
                                         , onClick <| DiyalogMsg DiyalgMsg.ShowingModal ] 
                                         [ i [ Attr.class "material-icons" ] 
                                             [ text "add" ]
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
       [ img  [ Attr.src "static/img/logo-nav.png", Attr.class "circle" ] [] 
       , span [ Attr.class "title" ] [ text warehouse.name ]
       , p    [ ] [ strong [] [ text "Stock: " ]
                  , text <| toString <| Maybe.withDefault 0.0 warehouse.stock ]
       ]
   
editBtn : Warehouse -> Html WarehouseMsg.Msg
editBtn warehouse =
    button
        [ Attr.class "btn regular" 
        , onClick (ShowWarehouse warehouse.id)
        ]
        [ i [ Attr.class "fa fa-pencil mr1"] [], text "Edit" ]
