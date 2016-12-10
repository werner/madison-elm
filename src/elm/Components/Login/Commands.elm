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
logInUrl = "http://localhost:9000/login"

userDecoder : Decode.Decoder User
userDecoder = 
    Decode.map3 User
        (field "email"    Decode.string)
        (field "password" Decode.string)
        (field "passwordConfirmation" Decode.string)

encodedRequest : User -> Encode.Value
encodedRequest user =
            Encode.object
                [ ( "email", Encode.string user.email )
                , ( "password", Encode.string user.password )
                , ( "passwordConfirmation", Encode.string user.passwordConfirmation )
                ]
