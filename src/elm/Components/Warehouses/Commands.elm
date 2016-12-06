module Components.Warehouses.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Components.Warehouses.Models exposing (WarehouseId, Warehouse)
import Components.Warehouses.Messages exposing (..)

fetchAll : Cmd Msg
fetchAll = 
    Http.get fetchAllUrl collectionDecoder
        |> Http.send OnFetchAll

fetchAllUrl : String
fetchAllUrl = "http://localhost:9090/warehouses"

collectionDecoder : Decode.Decoder (List Warehouse)
collectionDecoder = Decode.list memberDecoder

memberDecoder : Decode.Decoder Warehouse
memberDecoder =
    Decode.map4 Warehouse
        (field "id"     Decode.string)
        (field "name"   Decode.string)
        (field "userId" Decode.int)
        (field "stock"  Decode.float)
