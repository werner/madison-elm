module Update exposing (..)

import Routing  exposing (parseLocation)
import Messages exposing (Msg(..))
import Models   exposing (Model)
import Components.Warehouses.Update
import Components.Login.Update

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
    case msg of
        LoginMsg subMsg ->
            let
                ( updateLogin, cmd ) =
                    Components.Login.Update.update subMsg model.user
            in
                ( { model | user = updateLogin }, Cmd.none )

        WarehousesMsg subMsg ->
            let
                ( updateWarehouses, cmd ) =
                    Components.Warehouses.Update.update subMsg model.warehouses
            in
                ( { model | warehouses = updateWarehouses }, Cmd.map WarehousesMsg cmd )

        OnLocationChange location ->
            let
                newRoute = parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )

