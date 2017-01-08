module Components.Login.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Json.Encode as Encode
import Components.Login.Messages exposing (..)
import Components.Login.Models exposing (..)

logIn : LoginModel -> Cmd Msg
logIn ({ user, referer } as model) =
    Http.post logInUrl (Http.jsonBody (encodedRequest user)) userDecoder
        |> Http.send (OnLogIn referer)

logInUrl : String
logInUrl = "http://localhost:9090/login"

userDecoder : Decode.Decoder CurrentUser
userDecoder = 
    Decode.map2 CurrentUser
        (field "suId"     Decode.string)
        (field "suEmail"  Decode.string)

encodedRequest : User -> Encode.Value
encodedRequest user =
            Encode.object
                [ ( "authEmail",     Encode.string user.email )
                , ( "authPassword",  Encode.string user.password )
                ]
