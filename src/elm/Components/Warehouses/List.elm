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

view : WarehouseModel WarehouseMsg.Msg -> Html WarehouseMsg.Msg
view model = 
    div []
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

warehouseRow : Warehouse -> Html WarehouseMsg.Msg
warehouseRow warehouse = 
    tr []
       [ td [] [ text (Maybe.withDefault "" warehouse.id) ]
       , td [] [ text warehouse.name] 
       , td [] [ text (toString (Maybe.withDefault 0.0 warehouse.stock)) ]
       , td [] [ editBtn warehouse ]
       ]

editBtn : Warehouse -> Html WarehouseMsg.Msg
editBtn warehouse =
    button
        [ Attr.class "btn regular" 
        , onClick (ShowWarehouse warehouse.id)
        ]
        [ i [ Attr.class "fa fa-pencil mr1"] [], text "Edit" ]
