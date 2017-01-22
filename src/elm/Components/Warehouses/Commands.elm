module Components.Warehouses.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Json.Encode as Encode
import Components.Warehouses.Models exposing (WarehouseId, Warehouse)
import Components.Warehouses.Messages exposing (..)

fetchAll : Cmd Msg
fetchAll = 
    Http.get fetchAllUrl collectionDecoder
        |> Http.send OnFetchAll

fetchAllUrl : String
fetchAllUrl = "http://localhost:9090/warehouses"

saveUrl : String -> String
saveUrl warehouseId = "http://localhost:9090/warehouses/" ++ warehouseId

collectionDecoder : Decode.Decoder (List Warehouse)
collectionDecoder = Decode.list memberDecoder

memberDecoder : Decode.Decoder Warehouse
memberDecoder =
    Decode.map3 Warehouse
        (field "id"     Decode.string)
        (field "name"   Decode.string)
        (field "stock"  Decode.float)

saveRequest : Warehouse -> Http.Request Warehouse
saveRequest warehouse = 
    Http.request
        { body = memberEncoded warehouse |> Http.jsonBody
        , expect = Http.expectJson memberDecoder
        , headers = []
        , method = "PUT"
        , timeout = Nothing
        , url = saveUrl warehouse.id
        , withCredentials = False
        }

save : Warehouse -> Cmd Msg
save warehouse =
    saveRequest warehouse
        |> Http.send OnSave

memberEncoded : Warehouse -> Encode.Value
memberEncoded warehouse =
    let
        list =
            [ ( "id",     Encode.string warehouse.id ) 
            , ( "name",   Encode.string warehouse.name )
            , ( "stock",  Encode.float warehouse.stock )]
    in
        list
            |> Encode.object
