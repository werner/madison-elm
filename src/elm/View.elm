module View exposing (..)

import Html     exposing (Html, div, text)
import Messages exposing (Msg(..))
import Models   exposing (Model)
import Components.Warehouses.List

view : Model -> Html Msg
view model = 
    div []
        [ page model ]

page : Model -> Html Msg
page model = 
    Html.map WarehousesMsg (Components.Warehouses.List.view model.warehouses)
