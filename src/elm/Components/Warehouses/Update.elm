module Components.Warehouses.Update exposing (..)

import Components.Warehouses.Messages exposing (Msg(..))
import Components.Warehouses.Models   exposing (Warehouse)

update : Msg -> List Warehouse -> ( List Warehouse, Cmd Msg )
update message warehouses =
    case message of
        NoOp ->
            ( warehouses, Cmd.none )
