module Components.Warehouses.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Json.Encode as Encode
import Components.Warehouses.Models exposing (WarehouseId, Warehouse)
import Components.Warehouses.Messages exposing (..)

fetchAll : String -> Cmd Msg
fetchAll token = 
    getAllRequest token 
        |> Http.send OnFetchAll

getAllRequest : String -> Http.Request (List Warehouse)
getAllRequest token = 
    Http.request
        { body = Http.jsonBody filterEncoded
        , expect = Http.expectJson collectionDecoder
        , headers = [ Http.header "Accept" "application/json"
                    , Http.header "madison-auth" token]
        , method = "GET"
        , timeout = Nothing
        , url = fetchAllUrl
        , withCredentials = False
        }

fetchAllUrl : String
fetchAllUrl = "http://localhost:9090/warehouses?sortField=name-asc&sortField=id-asc&limit=10&offset=0"

saveUrl : Int -> String
saveUrl warehouseId = 
    case warehouseId of 
        0 -> "http://localhost:9090/warehouses/"
        _ -> "http://localhost:9090/warehouses/" ++ toString warehouseId

collectionDecoder : Decode.Decoder (List Warehouse)
collectionDecoder = Decode.list memberDecoder

memberDecoder : Decode.Decoder Warehouse
memberDecoder =
    Decode.map2 Warehouse
        (field "wId"     (Decode.maybe Decode.int))
        (field "wName"   Decode.string)

saveRequest : Warehouse -> String -> Http.Request ()
saveRequest warehouse token = 
    Http.request
        { body = memberEncoded warehouse |> Http.jsonBody
        , expect = Http.expectStringResponse (\_ -> Ok ())
        , headers = [ Http.header "Accept" "application/json"
                    , Http.header "madison-auth" token]
        , method = "POST"
        , timeout = Nothing
        , url = saveUrl (Maybe.withDefault 0 warehouse.id)
        , withCredentials = False
        }

save : Warehouse -> String -> Cmd Msg
save warehouse token =
    saveRequest warehouse token
        |> Http.send ( OnSave token )

memberEncoded : Warehouse -> Encode.Value
memberEncoded warehouse =
    let
        list =
            [ ( "cwName",   Encode.string warehouse.name ) ]
    in
        list
            |> Encode.object

filterEncoded : Encode.Value
filterEncoded =
    let
        value =
            [ ( "filterName",   Encode.string "" )
            , ( "filterId",     Encode.int 0 ) ]
    in
        Encode.object value
