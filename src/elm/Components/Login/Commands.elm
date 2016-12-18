module Components.Login.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Json.Encode as Encode
import Components.Login.Messages exposing (..)
import Components.Login.Models exposing (..)

logIn : User -> Cmd Msg
logIn user =
    Http.post logInUrl (Http.jsonBody (encodedRequest user)) userDecoder
        |> Http.send OnLogIn

logInUrl : String
logInUrl = "http://localhost:9090/login"

userDecoder : Decode.Decoder User
userDecoder = 
    Decode.map2 User
        (field "authEmail"     Decode.string)
        (field "authPassword"  Decode.string)

encodedRequest : User -> Encode.Value
encodedRequest user =
            Encode.object
                [ ( "authEmail",     Encode.string user.email )
                , ( "authPassword",  Encode.string user.password )
                ]
