module View exposing (..)

import Html     exposing (Html, div, text)
import Messages exposing (Msg(..))
import Models   exposing (Model)
import Components.Login.Form
import Components.Register.Form
import ViewHelpers exposing (notFoundView)

import Components.Warehouses.View exposing (view)
import Routing exposing (Route(..))

view : Model -> Html Msg
view model = 
    div []
        [ page model ]

page : Model -> Html Msg
page model = 
    case model.route of
        LoginRoute ->
            Html.map LoginMsg (Components.Login.Form.view model.user) 

        RegisterRoute ->
            Html.map RegisterMsg (Components.Register.Form.view model.regUser)

        WarehouseRoutes a ->
            Html.map WarehousesMsg (Components.Warehouses.View.view a model.warehouses)

        NotFoundRoute ->
            notFoundView
