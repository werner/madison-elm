module Components.Warehouses.List exposing (..)

import Html exposing (..)
import Html.Attributes as Attr
import Components.Warehouses.Messages exposing (..)
import Components.Warehouses.Models exposing (Warehouse)
import Html.Events exposing (onClick)

import MainCss exposing (..)
import Components.Warehouses.Css exposing (..)

import Html.CssHelpers

{ id, class, classList } =
    Html.CssHelpers.withNamespace "madison"

view : List Warehouse -> Html Msg
view warehouses = 
    div []
        [ list warehouses]

list : List Warehouse -> Html Msg
list warehouses = 
    div [ Attr.class "container" ]
        [ div [ Attr.class "row" ]
              [ div [ Attr.class "col s12 l12" ]
                    [ div [ Attr.class "card-panel" ]
                          [ div [ Attr.class "row center valign-wrapper" ]
                                [ div [ Attr.class "col s1"] [ img  [ Attr.src "static/img/logo-nav.png" ] [] ]
                                , div [ Attr.class "col s8 left-align "] 
                                      [ div  [] [ h2 [] [ text "Warehouses" ] ] ]
                                , div [ Attr.class "col s3" ]
                                      [ button [ class []
                                               , Attr.class "btn waves-effect waves-light" ] 
                                               [ i [ class [ WarehouseIcon ]
                                                   , Attr.class "material-icons left" ] 
                                                   [ text "note_add" ]
                                               , span [ class [ WarehouseText ] ] [ text "New Warehouse" ] ] ]
                                ]
                          , div [ Attr.class "row" ] 
                                [ table [] 
                                [ thead []
                                  [ tr []
                                    [ th [] [ text "Id" ]
                                    , th [] [ text "Name" ]
                                    , th [] [ text "Stock"]
                                    , th [] [ text "Actions"]
                                    ]
                                  ]
                                , tbody [] (List.map warehouseRow warehouses)
                                ]
                              ]
                          ] 
                    ]
              ]
        ]

warehouseRow : Warehouse -> Html Msg
warehouseRow warehouse = 
    tr []
       [ td [] [ text warehouse.id ]
       , td [] [ text warehouse.name] 
       , td [] [ text (toString warehouse.stock) ]
       , td [] [ editBtn warehouse ]
       ]

editBtn : Warehouse -> Html Msg
editBtn warehouse =
    button
        [ Attr.class "btn regular" 
        , onClick (ShowWarehouse warehouse.id)
        ]
        [ i [ Attr.class "fa fa-pencil mr1"] [], text "Edit" ]
