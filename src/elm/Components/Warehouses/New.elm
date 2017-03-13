module Components.Warehouses.New exposing (..)

import Html exposing (..)
import Html.CssHelpers
import Html.Attributes as Attr
import Form exposing (Form, FieldState)
import Html.Events exposing (onInput, onClick)
import Form.Input as Input
import Diyalog.Message exposing (..)

import MainCss     exposing (..)
import ViewHelpers exposing (..)
import Components.Warehouses.Messages as WarehouseMsg exposing (Msg(..))
import Components.Warehouses.Models exposing (WarehouseModel)

{ id, class, classList } =
    Html.CssHelpers.withNamespace "madison"

view : Html msg -> Html msg
view body = 
    div [ Attr.class "modal-body" ]
        [ body ]

header : WarehouseModel WarehouseMsg.Msg -> String -> Html WarehouseMsg.Msg
header ({ form, errors, warehouse, warehouses } as model) header = 
      div [ Attr.class "modal-header" ] 
          [ button [ Attr.class "btn-flat"
                   , Attr.style [("float", "right")]
                   , onClick  <| DiyalogMsg CloseModal ] 
                   [ text "x" ]
          , div [ Attr.class "modal-title" ]
                [ div [ Attr.class "left" ] 
                      [ img [ Attr.src "static/img/logo-nav.png" ] [] ]
                , div [ class [ TitleNav ] ] [ div [ Attr.class "col s12 l12" ] 
                                                   [ h4 [] [ text header ] ] 
                                             ]
                ]
          ] 

body : WarehouseModel WarehouseMsg.Msg -> Html WarehouseMsg.Msg
body ({ form, errors, warehouse, warehouses } as model) =
    Html.map FormMsg <|
        div []
            [ div [ Attr.class "row" ] (showErrors errors)
            , div [ Attr.class "row" ]
                  [ div [ Attr.class "col s10 l10" ] 
                        (inputForm Input.textInput "name" "Name" form warehouse.name) ]
            ]

footer : Html WarehouseMsg.Msg
footer = 
    div [ Attr.class "modal-footer" ]
        [ button [ Attr.class "modal-action modal-close waves-effect waves-green btn-flat"
                 , onClick <| DiyalogMsg CloseModal ]
                 [ text "Cancel" ]
        , button [ Attr.class "modal-action modal-close waves-effect waves-green btn-flat" 
                 , onClick <| FormMsg Form.Submit ] 
                 [ text "Ok" ] ]
