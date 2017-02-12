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
        (field "id"     (Decode.maybe Decode.string))
        (field "name"   Decode.string)
        (field "stock"  (Decode.maybe Decode.float))

saveRequest : Warehouse -> String -> Http.Request Warehouse
saveRequest warehouse token = 
    Http.request
        { body = memberEncoded warehouse |> Http.jsonBody
        , expect = Http.expectJson memberDecoder
        , headers = [ Http.header "Accept" "application/json"
                    , Http.header "madison-auth" token]
        , method = "POST"
        , timeout = Nothing
        , url = saveUrl (Maybe.withDefault "" warehouse.id)
        , withCredentials = False
        }

save : Warehouse -> String -> Cmd Msg
save warehouse token =
    saveRequest warehouse token
        |> Http.send OnSave

memberEncoded : Warehouse -> Encode.Value
memberEncoded warehouse =
    let
        list =
            [ ( "cwName",   Encode.string warehouse.name ) ]
    in
        list
            |> Encode.object
