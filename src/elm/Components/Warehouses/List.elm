module Components.Warehouses.List exposing (..)

import Dialog
import Html exposing (..)
import Html.Attributes as Attr
import Components.Warehouses.Messages as WarehouseMsg exposing (..)
import Components.Warehouses.Models exposing (Warehouse, WarehouseModel)
import Html.Events exposing (onClick)

import Modal   exposing (dialogConfig, Msg(..))
import MainCss exposing (..)

import Html.CssHelpers

{ id, class, classList } =
    Html.CssHelpers.withNamespace "madison"

view : WarehouseModel -> Html WarehouseMsg.Msg
view model = 
    div []
        [ list model ]

list : WarehouseModel -> Html WarehouseMsg.Msg
list ({ warehouses, modal } as model) = 
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
                                [ Html.map ModalMsg <| button 
                                         [ Attr.class "btn-floating btn-large waves-effect waves-light right"
                                         , onClick ShowModal ] 
                                         [ i [ Attr.class "material-icons" ] 
                                             [ text "add" ]
                                         ]
                                ]
                          ] 
                    ]
              ]
        , Html.map ModalMsg <| Dialog.view 
                               (if model.modal.showDialog then
                                   Just <| dialogConfig ( div [] [ text "New Warehouse" ] )
                                                        ( div [] [ text "Body" ] )
                               else
                                   Nothing
                               )
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
