module Components.Warehouses.Edit exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value, href)
import Components.Warehouses.Messages exposing (..)
import Components.Warehouses.Models exposing (..)
import Html.Events exposing (onClick)

view : Warehouse -> Html Msg
view model = 
    div []
        [ nav model
        , form model ]

nav : Warehouse -> Html Msg
nav model =
    div [ class "clearfix mb2 white bg-black p1"]
        [ listBtn ]

form : Warehouse -> Html Msg
form warehouse = 
    div [ class "m3" ]
        [ h1 [] [ text warehouse.name ]
        , formLevel warehouse ]

formLevel : Warehouse -> Html Msg
formLevel warehouse =
    div
        [ class "clearfix py1"
        ]
        [ div [ class "col col-5" ] [ text "Level" ]
        , div [ class "col col-7" ]
            [ btnSave warehouse ]
        ]


btnSave : Warehouse -> Html Msg
btnSave warehouse =
    a [ class "btn ml1 h1", onClick (ChangeWarehouse warehouse.id "Test") ]
        [ i [ class "fa fa-plus-circle" ] [ text "Save" ] ]

listBtn : Html Msg
listBtn = 
    button
        [ class "btn regular" 
        , onClick <| ShowWarehouses "" 0]
        [ i [ class "fa fa-chevron-left mr1" ] [], text "List" ]
