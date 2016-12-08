module Components.Warehouses.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Components.Warehouses.Messages exposing (..)
import Components.Warehouses.Models exposing (Warehouse)
import Html.Events exposing (onClick)

view : List Warehouse -> Html Msg
view warehouses = 
    div []
        [ nav  warehouses
        , list warehouses]

nav : List Warehouse -> Html Msg
nav warehouses = 
    div [ class "clearfix mb2 white pg-black" ]
        [ div [ class "left p2" ] [ text "Warehouses " ] ]

list : List Warehouse -> Html Msg
list warehouses = 
    div [ class "p2" ]
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
        [ class "btn regular" 
        , onClick (ShowWarehouse warehouse.id)
        ]
        [ i [ class "fa fa-pencil mr1"] [], text "Edit" ]
