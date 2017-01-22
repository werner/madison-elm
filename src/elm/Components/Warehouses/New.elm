module Components.Warehouses.New exposing (..)

import Html exposing (..)
import Html.CssHelpers
import Html.Attributes as Attr
import Form exposing (Form, FieldState)
import Html.Events exposing (onInput, onClick)
import Form.Input as Input

import MainCss     exposing (..)
import ViewHelpers exposing (..)
import Components.Warehouses.Messages exposing (Msg(..))
import Components.Warehouses.Models exposing (WarehouseModel)

{ id, class, classList } =
    Html.CssHelpers.withNamespace "madison"

view : WarehouseModel -> Html Msg
view model = card model

card : WarehouseModel -> Html Msg
card ({ form, errors, warehouse, warehouses } as model) = 
      div [ Attr.class "container" ]
          [ div [ Attr.class "row" ]
              [ div [ Attr.class "col s12 l6 offset-l3" ] 
                    [ div [ Attr.class "card-panel" ] 
                          [ div [ Attr.class "row center valign-wrapper" ]
                                [ div [ Attr.class "left"]   [ img [ Attr.src "static/img/logo-nav.png" ] [] ]
                                , div [ class [ TitleNav ] ] [ div [ Attr.class "col s12 l12" ] 
                                                                   [ h4 [] [ text "New Warehouse" ] ] 
                                                             ]
                                , div [ Attr.class "col s2 l2" ]
                                      [ button [ Attr.class "btn-floating btn-large waves-effect waves-light right"
                                               , onClick ShowWarehouses ] [ text "Back" ] ] 
                                
                                ]
                          , Html.map FormMsg (formWarehouse model) 
                          ] 
                    ] 
              ]
          ]

formWarehouse : WarehouseModel -> Html Form.Msg
formWarehouse ({ form, errors, warehouse, warehouses } as model) =
    div []
        [ div [ Attr.class "row" ] (showErrors errors)
        , div [ Attr.class "row" ] (inputForm Input.textInput "name" "Name" form)
        , div [ Attr.class "row" ]
              [ button [ Attr.class "btn waves-effect waves-light col s12"
                           , onClick Form.Submit ] [ text "Save" ]
              ]
        ]
