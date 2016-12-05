module Update exposing (..)

import Messages exposing (Msg(..))
import Models   exposing (Model)
import Components.Warehouses.Update

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
    case msg of
        WarehousesMsg subMsg ->
            let
                ( updateWarehouses, cmd ) =
                    Components.Warehouses.Update.update subMsg model.warehouses
            in
                ( { model | warehouses = updateWarehouses }, Cmd.map WarehousesMsg cmd )

