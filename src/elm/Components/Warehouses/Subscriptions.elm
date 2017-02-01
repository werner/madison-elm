module Components.Warehouses.Subscriptions exposing (..)

import Components.Warehouses.Models exposing (WarehouseModel)
import Components.Warehouses.Messages exposing (Msg(..))
import Diyalog exposing (..)

subscriptions : WarehouseModel Msg -> Sub Msg
subscriptions model =
    Sub.batch [ Sub.map DiyalogMsg ( Diyalog.subscriptions model.modalForm ) ]

